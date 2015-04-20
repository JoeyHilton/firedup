class AddApprovedToFollows < ActiveRecord::Migration
  def change
    add_column :follows, :approved, :boolean, default: false
  end
end
