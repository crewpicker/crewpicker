class AddSalesmanToAds < ActiveRecord::Migration
  def change
    add_column :ads, :salesman, :string
  end
end
