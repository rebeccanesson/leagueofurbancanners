class CreateStatusChecks < ActiveRecord::Migration
  def change
    create_table :status_checks do |t|
      t.integer :fruit_tree_id
      t.datetime :date
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
