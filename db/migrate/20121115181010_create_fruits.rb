class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :name
      t.datetime :season_start
      t.datetime :season_end

      t.timestamps
    end
  end
end
