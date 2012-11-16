class RemoveHoursIntegerFromCannings < ActiveRecord::Migration
  def up
    remove_column :cannings, :hours_integer
  end

  def down
    add_column :cannings, :hours_integer, :string
  end
end
