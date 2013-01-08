class AddLeaderToPrunings < ActiveRecord::Migration
  def change
    add_column :prunings, :leader_id, :integer
  end
end
