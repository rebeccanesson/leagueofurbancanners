class CreateCannings < ActiveRecord::Migration
  def change
    create_table :cannings do |t|
      t.integer :canning_session_id
      t.integer :canner_id
      t.string :hours_integer

      t.timestamps
    end
  end
end
