class CreateHarvests < ActiveRecord::Migration
  def change
    create_table :harvests do |t|
      t.text :description
      t.string :tentative_date
      t.integer :harvesters_needed
      t.integer :canners_needed
      t.datetime :date
      t.integer :fruit_tree_id
      t.integer :leader_id
      t.integer :amount_harvested
      t.text :notes

      t.timestamps
    end
  end
end
