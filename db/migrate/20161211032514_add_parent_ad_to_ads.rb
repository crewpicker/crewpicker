class AddParentAdToAds < ActiveRecord::Migration
  def change
    add_reference :ads, :parent_ad, references: :ads, index: false
  end
end
