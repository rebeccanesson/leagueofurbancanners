class CreateCanningSessions < ActiveRecord::Migration
  def change
    create_table :canning_sessions do |t|
      t.integer :harvest_id
      t.integer :leader_id
      t.datetime :date
      t.integer :amount_canned
      t.integer :pints_canned
      t.text :notes

      t.timestamps
    end
  end
end
