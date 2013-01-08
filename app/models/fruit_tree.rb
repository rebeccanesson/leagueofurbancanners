class FruitTree < ActiveRecord::Base
  attr_accessible :fruit_id, :season_start_month, :season_start_day, :season_end_month, :season_end_day, :site_id, :pruning_candidate, :pruning_permission
  
  belongs_to :site
  has_many :status_checks, :order => "date DESC"
  has_many :harvests
  belongs_to :fruit
  has_many :prunings
  
  acts_as_gmappable :lng => :longitude, :lat => :latitude
  
  # validates :season_start_month, :inclusion => { :in => MONTHS }, :allow_nil => true
  # validates :season_end_month,  :inclusion => { :in => MONTHS }, :allow_nil => true
  # validates :season_start_day, :inclusion => { :in => (1..31).to_a }, :allow_nil => true
  # validates :season_end_day,  :inclusion => { :in => (1..31).to_a }, :allow_nil => true
  
  def longitude
      site.lon
  end
  
  def latitude
      site.lat
  end
  
  def gmaps4rails_address
    "#{street}, #{city}, MA #{zipcode}" 
  end
  
  
  def gmaps4rails_title
    tree_name
  end
  
  def gmaps4rails_sidebar
    "<li>#{tree_name}</li>" #put whatever you want here
  end
  
  def tree_name
      site.site_name + " " + fruit.name 
  end
  
  def start_month
    season_start_month? ? season_start_month : fruit.season_start_month
  end
  
  def start_day
    season_start_day? ? season_start_day : fruit.season_start_day
  end
  
  def end_month
    season_end_month? ? season_end_month : fruit.season_end_month
  end
  
  def end_day
    season_end_day? ? season_end_day : fruit.season_end_day
  end
  
end
