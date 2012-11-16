class AddSeasonRangeToFruitTrees < ActiveRecord::Migration
  def change
    add_column :fruit_trees, :season_start_month, :string
    add_column :fruit_trees, :season_start_day, :integer
    add_column :fruit_trees, :season_end_month, :string
    add_column :fruit_trees, :season_end_day, :integer
  end
end
