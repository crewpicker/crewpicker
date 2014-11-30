class RemovePersonIdFromBandMembers < ActiveRecord::Migration
  def change
    remove_column :band_members, :person_id, :integer
  end
end
