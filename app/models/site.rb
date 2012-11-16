class Site < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :lurc_contact_id, :note, :owner_id, :secondary_owner_id, :status, :street, :zipcode
  attr_accessible :lat, :lon, :gmaps
  # geocoded_by :address 
  # after_validation :geocode, :if => :street_changed? || :city_changed? || :zipcode_changed?
  
  acts_as_gmappable :lat => "lat", :lng => "lon"
  
  belongs_to :owner, :class_name => 'Person'
  belongs_to :secondary_owner, :class_name => 'Person'
  belongs_to :lurc_contact, :class_name => 'Person'
  has_many :fruit_trees
  has_many :fruits, :through => :fruit_trees
  has_many :status_checks, :through => :fruit_trees
  has_many :harvests, :through => :fruit_trees
  
  # Bad practice to accept nested attributes for a parent, but forms are set up so that only new owners can/will be selected
  # this way and existing owners cannot be edited from within a user.  
  accepts_nested_attributes_for :owner, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  accepts_nested_attributes_for :secondary_owner, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  accepts_nested_attributes_for :lurc_contact, :reject_if => proc { |attributes| attributes['last_name'].blank? }
  attr_accessible :owner_attributes, :secondary_owner_attributes, :lurc_contact_attributes
  
  accepts_nested_attributes_for :fruit_trees
  attr_accessible :fruit_trees_attributes
  
  
  @@STATUSES = ['Not Contacted', 'Owner Contacted - No Response', 'Contacted - No Permission', 'Open Harvest', 'Harvest with Owner Coordination']
  def self.STATUSES 
     @@STATUSES
  end
  
  validates :status, :inclusion => { :in => @@STATUSES }, :presence => true
    
  def address
    street + ", " + city + ", MA " + zipcode
  end
  
  def gmaps4rails_address
    "#{street}, #{city}, MA #{zipcode}" 
  end
  
  def gmaps4rails_title
    street + " fruits: " + fruits.collect { |f| f.name }.join(", ")
  end
  
  def gmaps4rails_sidebar
    "<li>#{street}</li>" #put whatever you want here
  end
  
end