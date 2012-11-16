class StatusCheck < ActiveRecord::Base
  attr_accessible :date, :fruit_tree_id, :notes, :status
  
  STATUSES = %w[not ripe yet, ripe, overripe/past, no fruit visible]
  
  
end
