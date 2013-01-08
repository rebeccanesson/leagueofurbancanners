class AddPruningCandidateAndPruningPermissionToFruitTrees < ActiveRecord::Migration
  def change
    add_column :fruit_trees, :pruning_candidate, :integer
    add_column :fruit_trees, :pruning_permission, :integer
  end
end
