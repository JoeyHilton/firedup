class AddColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :current_employer, :boolean, :default => false
  end
end
