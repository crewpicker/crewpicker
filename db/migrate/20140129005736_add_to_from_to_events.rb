class AddToFromToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.datetime :from
      t.datetime :to
    end
  end
end
