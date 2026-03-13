class AddCardConfigToAccessLevels < ActiveRecord::Migration[7.0]
  def change
    add_column :access_levels, :page_size, :string, default: 'A4'
    add_column :access_levels, :page_orientation, :string, default: 'portrait'
    add_column :access_levels, :margin_top, :integer, default: 0
    add_column :access_levels, :margin_bottom, :integer, default: 0
    add_column :access_levels, :margin_left, :integer, default: 0
    add_column :access_levels, :margin_right, :integer, default: 0
    add_column :access_levels, :dpi, :integer, default: 96
    add_column :access_levels, :zoom, :decimal, precision: 5, scale: 4, default: 1.0
    add_column :access_levels, :card_width, :integer
    add_column :access_levels, :card_height, :integer
    add_column :access_levels, :columns, :integer, default: 3
    add_column :access_levels, :rows, :integer, default: 2
    add_column :access_levels, :text_top, :integer
    add_column :access_levels, :text_left, :integer, default: 28
    add_column :access_levels, :text_right, :integer, default: 28
    add_column :access_levels, :font_size, :integer, default: 24
    add_column :access_levels, :font_color, :string, default: '#000000'
  end
end
