class AddEventIdToBands < ActiveRecord::Migration
  def change
    add_reference :bands, :event, index: true, foreign_key: true
  end
end
