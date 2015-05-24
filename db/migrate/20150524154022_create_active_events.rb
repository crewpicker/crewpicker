class CreateActiveEvents < ActiveRecord::Migration
  def change
    create_table :active_events do |t|
      t.references :event, index: true

      t.timestamps
    end
  end
end
