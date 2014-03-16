class CreateCrewMerchandiseOrders < ActiveRecord::Migration
  def change
    create_table :crew_merchandise_orders do |t|
      t.references :volunteer, index: true

      t.timestamps
    end
  end
end
