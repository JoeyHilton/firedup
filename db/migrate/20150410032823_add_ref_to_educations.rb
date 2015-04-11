class AddRefToEducations < ActiveRecord::Migration
  def change
    # add_reference :educations, :profile, index: true
    add_foreign_key :educations, :profiles
  end
end
