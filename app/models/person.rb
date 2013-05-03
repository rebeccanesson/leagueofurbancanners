class Person < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone
  
  default_scope order('last_name ASC, first_name ASC')
  
  belongs_to :user, :dependent => :destroy  # deleting the person should delete the user
  
  has_many :owned_sites, :class_name => 'Site', :foreign_key => 'owner_id'
  has_many :secondary_owned_sites, :class_name => 'Site', :foreign_key => 'secondary_owner_id'
  has_many :contact_sites, :class_name => 'Site', :foreign_key => 'lurc_contact_id'
  
  validates_presence_of :last_name
  before_save :copy_email_from_user
  
  def full_name
    first_name + " " + last_name
  end
  
  def merge_in(other_person)
    owned_sites << other_person.owned_sites
    secondary_owned_sites << other_person.secondary_owned_sites
    contact_sites << other_person.contact_sites
    self.email = other_person.email unless self.email
    self.first_name = other_person.first_name unless self.first_name
    self.phone = other_person.phone unless self.phone
    save! 
    other_person.destroy
  end
  
  def all_sites
    (owned_sites + secondary_owned_sites + contact_sites).uniq
  end
     
  def site_role(site)
    res = []
    res << "owner" if site.owner == self
    res << "secondary owner" if site.secondary_owner == self
    res << "site coordinator" if site.lurc_contact == self
    res.join(", ")
  end
  
  def copy_email_from_user
    self.email = self.user.email if self.email == nil && self.user_id?
  end
  
end
