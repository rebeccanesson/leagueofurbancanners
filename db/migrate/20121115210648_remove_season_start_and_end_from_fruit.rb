class RemoveSeasonStartAndEndFromFruit < ActiveRecord::Migration
  def up
    remove_column :fruits, :season_start
    remove_column :fruits, :season_end
  end

  def down
    add_column :fruits, :season_end, :datetime
    add_column :fruits, :season_start, :datetime
  end
end
