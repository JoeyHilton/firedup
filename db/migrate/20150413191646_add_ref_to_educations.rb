class AddRefToEducations < ActiveRecord::Migration
  def change
    add_reference :educations, :user, index: true
    add_foreign_key :educations, :users
  end
end
