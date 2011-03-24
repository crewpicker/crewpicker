class CreateStages < ActiveRecord::Migration
  def self.up
    create_table :stages do |t|
      t.string :name
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end

  def self.down
    drop_table :stages
  end
end
