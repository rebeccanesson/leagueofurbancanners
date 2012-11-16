class Harvesting < ActiveRecord::Base
  attr_accessible :harvest_id, :hours, :harvester_id
  
  belongs_to :harvest
  belongs_to :harvester, :class_name => "Person"
  
end
