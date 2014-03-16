class CreateMerchandiseArticles < ActiveRecord::Migration
  def change
    create_table :merchandise_articles do |t|
      t.string :name

      t.timestamps
    end
  end
end
