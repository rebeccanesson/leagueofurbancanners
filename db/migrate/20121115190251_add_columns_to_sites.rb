class AddColumnsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :lat, :float
    add_column :sites, :lon, :float
    add_column :sites, :gmaps, :boolean
  end
end
