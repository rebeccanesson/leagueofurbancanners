class Person < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone
  
  belongs_to :user, :dependent => :destroy  # deleting the person should delete the user
  
  has_many :owned_sites, :class_name => 'Site'
  has_many :secondary_owned_sites, :class_name => 'Site'
  has_many :contact_sites, :class_name => 'Site'
  
  validates_presence_of :last_name
  
  def full_name
    first_name + "  " + last_name
  end
  
end
