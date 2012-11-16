class RemoveTentativeDateFromHarvests < ActiveRecord::Migration
  def up
    remove_column :harvests, :tentative_date
  end

  def down
    add_column :harvests, :tentative_date, :datetime
  end
end
