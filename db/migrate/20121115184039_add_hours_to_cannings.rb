class AddHoursToCannings < ActiveRecord::Migration
  def change
    add_column :cannings, :hours, :integer
  end
end
