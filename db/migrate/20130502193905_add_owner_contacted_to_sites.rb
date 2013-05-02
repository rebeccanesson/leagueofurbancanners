class AddOwnerContactedToSites < ActiveRecord::Migration
  def change
    add_column :sites, :owner_contacted, :boolean, :default => false
  end
end
