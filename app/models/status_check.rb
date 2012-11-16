class StatusCheck < ActiveRecord::Base
  attr_accessible :date, :fruit_tree_id, :notes, :status
  
  belongs_to :fruit_tree
  
  STATUSES = ['not ripe yet', 'ripe', 'overripe/past', 'no fruit visible']
  
  def check_name
    fruit_tree.tree_name + " status " + date.to_s(:human)
  end
end
