class RemoveSeasonStartAndEndFromFruitTrees < ActiveRecord::Migration
  def up
    remove_column :fruit_trees, :season_start
    remove_column :fruit_trees, :season_end
  end

  def down
    add_column :fruit_trees, :season_end, :datetime
    add_column :fruit_trees, :season_start, :datetime
  end
end
