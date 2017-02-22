class AddCompletedToAds < ActiveRecord::Migration
  def change
    add_column :ads, :completed, :boolean
  end
end
