class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.references :user, null: false, foreign_key: true
      t.string :token
      t.string :key_digest
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :api_keys, :token, unique: true
  end
end
