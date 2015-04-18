class AddRefToJboards < ActiveRecord::Migration
  def change
    add_reference :jboards, :user, index: true
    add_foreign_key :jboards, :users
  end
end
