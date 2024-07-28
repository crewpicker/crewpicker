class CreateTk81Skuespillere < ActiveRecord::Migration[7.0]
  def change
    create_table :tk81_skuespillere do |t|
      t.references :tk81_pamelding, null: false, foreign_key: true
      t.boolean :samme_rolle
      t.boolean :vil_danse
      t.string :klesstorrelse
      t.string :skostorrelse
      t.boolean :samtykke

      t.timestamps
    end
  end
end
