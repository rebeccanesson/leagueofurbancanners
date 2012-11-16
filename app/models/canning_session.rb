class CanningSession < ActiveRecord::Base
  attr_accessible :amount_canned, :date, :harvest_id, :leader_id, :notes, :pints_canned
  
  belongs_to :harvest
  has_one :fruit_tree, :through => :harvest
  belongs_to :leader, :class_name => "Person"
  
end
