class ChangeHarvestingsHarvesterColumnName < ActiveRecord::Migration
    def change
       rename_column :harvestings, :person_id, :harvester_id
    end
end
