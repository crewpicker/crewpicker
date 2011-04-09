class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :phone, :limit => 8

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
