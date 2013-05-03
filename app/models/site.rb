class Site < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :lurc_contact_id, :note, :owner_id, :secondary_owner_id, :status, :street, :zipcode
  attr_accessible :lat, :lon, :gmaps, :street_number, :street_name, :owner_contacted
  # geocoded_by :address 
  # after_validation :geocode, :if => :street_changed? || :city_changed? || :zipcode_changed?
  
  acts_as_gmappable :lat => "lat", :lng => "lon"
  
  belongs_to :owner, :class_name => 'Person'
  belongs_to :secondary_owner, :class_name => 'Person'
  belongs_to :lurc_contact, :class_name => 'Person'
  has_many :fruit_trees, :dependent => :destroy
  has_many :fruits, :through => :fruit_trees
  has_many :status_checks, :through => :fruit_trees
  has_many :harvests, :through => :fruit_trees
  has_many :prunings, :through => :fruit_trees
  
  scope :has_fruit_in, lambda { |fruit_ids| joins(:fruit_trees).where("fruit_trees.fruit_id in (?)", fruit_ids) }
  
  # Bad practice to accept nested attributes for a parent, but forms are set up so that only new owners can/will be selected
  # this way and existing owners cannot be edited from within a user.  
  accepts_nested_attributes_for :owner, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  accepts_nested_attributes_for :secondary_owner, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  accepts_nested_attributes_for :lurc_contact, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  attr_accessible :owner_attributes, :secondary_owner_attributes, :lurc_contact_attributes
  
  accepts_nested_attributes_for :fruit_trees, :reject_if => proc { |attributes| attributes['fruit_id'].blank? }
  attr_accessible :fruit_trees_attributes
  
  def self.by_street
      order('street_name ASC, street_number ASC')
  end
  
  @@STATUSES = ['need to coordinate date/time with owner', '24 hour notice with reply required', '24 hour notice with no reply required', 'permission to harvest denied']
  def self.STATUSES 
     @@STATUSES
  end
  
  @@SITE_FILTERS = ['Coordinated', 'Not Coordinated']
  def self.SITE_FILTERS
      @@SITE_FILTERS
  end
  
  def self.zipcodes
      Site.all.collect { |s| s.zipcode }.uniq.compact.sort
  end
  
  def self.filter_sites_by(sites, site_filter)
      if (site_filter == 'Coordinated')
          sites.reject { |s| !s.lurc_contact || s.lurc_contact.full_name == "Unknown Unknown" }
      elsif (site_filter == 'Not Coordinated')
          sites.select { |s| !s.lurc_contact || s.lurc_contact.full_name == "Unknown Unknown" }
      else
          sites
      end
  end
  
  def self.filter_sites_by_zipcodes(sites, zipcodes)
      sites.select { |s| zipcodes.include?(s.zipcode) }
  end
  
  def site_name
    if User.session_current_user && sees_street(User.session_current_user)
      street_name + " (##{street_number})"
    else          
      street_name + " (#hidden)"
    end
  end
  
  # validates :status, :inclusion => { :in => @@STATUSES }, :presence => true
    
  def address
    "#{street_number} #{street_name}, #{city}, MA #{zipcode}"
  end
  
  def gmaps4rails_address
    "#{street_number} #{street_name}, #{city}, MA #{zipcode}" 
  end
  
  def gmaps4rails_title
    "#{street_number} #{street_name} fruits: " + fruits.collect { |f| f.name }.join(", ")
  end
  
  def gmaps4rails_sidebar
    "<li>#{site_name}</li>" #put whatever you want here
  end
  
  def sees_street(user)
      user.admin? || user.organizer? || user.person == lurc_contact || user.person == owner || user.person == secondary_owner
  end
  
end
