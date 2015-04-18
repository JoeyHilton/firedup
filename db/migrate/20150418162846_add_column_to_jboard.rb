class AddColumnToJboard < ActiveRecord::Migration
  def change
    add_column :jboards, :category, :string
  end
end
