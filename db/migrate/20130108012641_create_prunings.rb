class CreatePrunings < ActiveRecord::Migration
  def change
    create_table :prunings do |t|
      t.integer :fruit_tree_id
      t.datetime :date

      t.timestamps
    end
  end
end
