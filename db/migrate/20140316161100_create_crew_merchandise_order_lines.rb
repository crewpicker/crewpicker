class CreateCrewMerchandiseOrderLines < ActiveRecord::Migration
  def change
    create_table :crew_merchandise_order_lines do |t|
      t.integer :crew_merchandise_order_id
      t.integer :quantity
      t.integer :merchandise_article_variant_id

      t.timestamps
    end
    add_index :crew_merchandise_order_lines, :crew_merchandise_order_id, name: 'crew_merch_order_lines_crew_merch_order_id'
    add_index :crew_merchandise_order_lines, :merchandise_article_variant_id, name: 'crew_merch_order_lines_merch_article_variant_id'
  end
end
