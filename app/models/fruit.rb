class Fruit < ActiveRecord::Base
  attr_accessible :name, :season_start_month, :season_start_day, :season_end_month, :season_end_day
  
  has_many :fruit_trees
  has_many :sites, :through => :fruit_trees
  
  validates :season_start_month, :presence => true,  :inclusion => { :in => MONTHS }
  validates :season_end_month, :presence => true, :inclusion => { :in => MONTHS }
  validates :season_start_day, :presence => true, :inclusion => { :in => (1..31).to_a }
  validates :season_end_day, :presence => true, :inclusion => { :in => (1..31).to_a }
  
end
