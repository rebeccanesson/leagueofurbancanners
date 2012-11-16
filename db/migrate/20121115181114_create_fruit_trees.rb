class CreateFruitTrees < ActiveRecord::Migration
  def change
    create_table :fruit_trees do |t|
      t.integer :site_id
      t.integer :fruit_id
      t.datetime :season_start
      t.datetime :season_end

      t.timestamps
    end
  end
end
