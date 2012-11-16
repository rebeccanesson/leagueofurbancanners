class RemovePersonIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :person_id
  end

  def down
    add_column :users, :person_id, :integer
  end
end
