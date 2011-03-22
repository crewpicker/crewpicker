class CreateBands < ActiveRecord::Migration
  def self.up
    create_table :bands, :id => false do |t|
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

      t.timestamps
    end
  end

  def self.down
    drop_table :bands
  end
end
