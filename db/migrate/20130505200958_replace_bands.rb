class ReplaceBands < ActiveRecord::Migration
  def up
    create_table :bands, :force => true do |t|
      t.string :name
      t.string :contact_name
      t.string :email
      t.string :phone
      t.text :address
      t.string :postal_code
      t.string :city
      t.text :description
      t.string :song_title
      t.string :song_composer
      t.text :song_lyrics
      t.string :playtime_wish
      t.string :playtime_wish_alt
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :user
      t.boolean :completed

      t.timestamps
    end
  end

  def down
    create_table :bands, :id => false, :force => true do |t|
      t.string :uuid, :limit => 36, :primary => true
      t.string :name
      t.string :contact_name
      t.string :email
      t.string :phone
      t.text :address
      t.text :description
      t.string :song_title
      t.string :song_composer
      t.text :song_lyrics
      t.string :playtime_wish
      t.string :playtime_wish_alt
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :user

      t.timestamps
    end
  end
end
