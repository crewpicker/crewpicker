class CreateFireguards < ActiveRecord::Migration
  def self.up
    create_table :fireguards do |t|
      t.string :name
      t.integer :age
      t.text :address
      t.string :phone
      t.string :mobile
      t.string :email
      t.text :notes
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :fireguards
  end
end
