class FruitTree < ActiveRecord::Base
  attr_accessible :fruit_id, :season_start_month, :season_start_day, :season_end_month, :season_end_day, :site_id
  
  belongs_to :site
  has_many :status_checks, :order => "date DESC"
  has_many :harvests
  belongs_to :fruit
  
  # validates :season_start_month, :inclusion => { :in => MONTHS }, :allow_nil => true
  # validates :season_end_month,  :inclusion => { :in => MONTHS }, :allow_nil => true
  # validates :season_start_day, :inclusion => { :in => (1..31).to_a }, :allow_nil => true
  # validates :season_end_day,  :inclusion => { :in => (1..31).to_a }, :allow_nil => true
  
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
