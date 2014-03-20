class AddBackgroundToAccessLevels < ActiveRecord::Migration
  def change
    add_column :access_levels, :background, :string
  end
end
