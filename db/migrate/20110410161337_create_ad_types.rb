class CreateAdTypes < ActiveRecord::Migration
  def self.up
    create_table :ad_types do |t|
      t.string :name
      t.integer :value
      t.string :invoice_name

      t.timestamps
    end
  end

  def self.down
    drop_table :ad_types
  end
end
