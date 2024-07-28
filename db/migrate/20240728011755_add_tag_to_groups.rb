class AddTagToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :tag, :string, index: true
  end
end
