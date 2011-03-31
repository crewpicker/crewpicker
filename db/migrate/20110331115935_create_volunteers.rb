class CreateVolunteers < ActiveRecord::Migration
  def self.up
    create_table :volunteers do |t|
      t.string :name
      t.text :address
      t.date :birthday
      t.string :email
      t.string :phone
      t.integer :group_id
      t.string :access_level

      t.timestamps
    end
  end

  def self.down
    drop_table :volunteers
  end
end
