class AddChosenToCrewApplications < ActiveRecord::Migration
  def self.up
    change_table :crew_applications do |t|
      t.boolean :chosen
    end
  end

  def self.down
    change_table :crew_applications do |t|
      t.remove :chosen
    end
  end
end
