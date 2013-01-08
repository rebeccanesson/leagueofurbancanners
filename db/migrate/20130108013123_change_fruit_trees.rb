class ChangeFruitTrees < ActiveRecord::Migration
  def up
      change_column :fruit_trees, :pruning_candidate, :boolean
      change_column :fruit_trees, :pruning_permission, :boolean
  end

  def down
      change_column :fruit_trees, :pruning_candidate, :integer
      change_column :fruit_trees, :pruning_permission, :integer
  end
end
