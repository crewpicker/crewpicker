class CreateTk81Pameldinger < ActiveRecord::Migration[7.0]
  def change
    create_table :tk81_pameldinger do |t|
      t.string :navn
      t.date :fodselsdato
      t.string :skole
      t.string :telefon
      t.string :navn_foresatte
      t.string :epost_foresatte
      t.string :telefon_foresatte
      t.references :foresatte_bidrag, foreign_key: { to_table: :groups }, null: true
      t.references :event, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
