class CreateTk81Teknikere < ActiveRecord::Migration[7.0]
  def change
    create_table :tk81_teknikere do |t|
      t.references :tk81_pamelding, null: false, foreign_key: true
      t.references '1valg', null: true, foreign_key: { to_table: :groups }
      t.references '2valg', null: true, foreign_key: { to_table: :groups }
      t.references '3valg', null: true, foreign_key: { to_table: :groups }
      t.references :valgt, null: true, foreign_key: { to_table: :groups }

      t.timestamps
    end
  end
end
