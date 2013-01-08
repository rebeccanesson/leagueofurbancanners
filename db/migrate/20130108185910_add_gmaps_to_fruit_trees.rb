class AddGmapsToFruitTrees < ActiveRecord::Migration
  def change
    add_column :fruit_trees, :gmaps, :boolean
  end
end
