class RemoveNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone
  end

  def down
    add_column :users, :phone, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
  end
end
