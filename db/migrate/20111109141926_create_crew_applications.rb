class CreateCrewApplications < ActiveRecord::Migration
  def self.up
    create_table :crew_applications do |t|
      t.string :name
      t.text :address
      t.date :birthday
      t.string :email
      t.string :phone
      t.text :experience
      t.integer :volunteer_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :crew_applications
  end
end
