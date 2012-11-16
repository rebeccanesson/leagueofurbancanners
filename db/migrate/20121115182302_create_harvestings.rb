class CreateHarvestings < ActiveRecord::Migration
  def change
    create_table :harvestings do |t|
      t.integer :harvest_id
      t.integer :person_id
      t.integer :hours

      t.timestamps
    end
  end
end
