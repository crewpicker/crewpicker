class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :name
      t.string :contact
      t.string :phone
      t.string :email
      t.integer :ad_type_id
      t.text :address
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :ads
  end
end
