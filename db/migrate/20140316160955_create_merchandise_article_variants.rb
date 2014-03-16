class CreateMerchandiseArticleVariants < ActiveRecord::Migration
  def change
    create_table :merchandise_article_variants do |t|
      t.string :name
      t.references :merchandise_article, index: true

      t.timestamps
    end
  end
end
