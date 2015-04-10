class AddRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :profile, index: true
    add_foreign_key :jobs, :profiles
  end
end
