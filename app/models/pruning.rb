class Pruning < ActiveRecord::Base
  attr_accessible :date, :fruit_tree_id
  
  belongs_to :fruit_tree
end
