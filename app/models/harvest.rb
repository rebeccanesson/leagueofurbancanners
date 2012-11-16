class Harvest < ActiveRecord::Base
  attr_accessible :amount_harvested, :canners_needed, :date, :description, :fruit_tree_id, :harvesters_needed, :leader_id, :notes, :tentative_date
  
  belongs_to :fruit_tree
  has_one :site, :through => :fruit_tree
  belongs_to :leader, :class_name => "Person"
  has_many :harvestings
  has_many :harvesters, :through => :harvestings, :class_name => "Person"
  
end
