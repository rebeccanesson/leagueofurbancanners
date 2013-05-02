class AddStreetNumberAndStreetNameToSites < ActiveRecord::Migration
  def change
    add_column :sites, :street_number, :integer
    add_column :sites, :street_name, :string
  end
end
