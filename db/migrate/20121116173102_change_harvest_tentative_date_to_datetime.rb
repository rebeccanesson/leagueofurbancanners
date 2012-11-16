class ChangeHarvestTentativeDateToDatetime < ActiveRecord::Migration
  def up
      change_column :harvests, :tentative_date, :datetime
  end

  def down
      change_column :harvests, :tentative_date, :string
  end
end
