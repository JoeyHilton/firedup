class AddProfileIdToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :profile, index: true
  end
end
