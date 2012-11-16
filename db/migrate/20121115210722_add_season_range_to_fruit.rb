class AddSeasonRangeToFruit < ActiveRecord::Migration
  def change
    add_column :fruits, :season_start_month, :string
    add_column :fruits, :season_start_day, :integer
    add_column :fruits, :season_end_month, :string
    add_column :fruits, :season_end_day, :integer
  end
end
