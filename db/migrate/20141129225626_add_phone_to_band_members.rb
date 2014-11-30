class AddPhoneToBandMembers < ActiveRecord::Migration
  def change
    add_column :band_members, :phone, :string
  end
end
