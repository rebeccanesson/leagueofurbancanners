class ChangeFruitTrees < ActiveRecord::Migration
  def up
      remove_column :fruit_trees, :pruning_candidate
      remove_column :fruit_trees, :pruning_permission
      add_column :fruit_trees, :pruning_candidate, :boolean
      add_column :fruit_trees, :pruning_permission, :boolean
  end

  def down
      remove_column :fruit_trees, :pruning_candidate
      remove_column :fruit_trees, :pruning_permission
      add_column :fruit_trees, :pruning_candidate, :integer
      add_column :fruit_trees, :pruning_permission, :integer
  end
end
