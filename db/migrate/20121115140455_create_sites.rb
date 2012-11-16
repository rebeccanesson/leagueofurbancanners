class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :street
      t.string :city
      t.string :zipcode
      t.string :latitude
      t.string :longitude
      t.integer :owner_id
      t.integer :secondary_owner_id
      t.integer :lurc_contact_id
      t.text :note
      t.string :status

      t.timestamps
    end
  end
end
