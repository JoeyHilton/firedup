class FixJobsColumnNames < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.rename :job_company, :company
      t.rename :job_start_date, :start_date
      t.rename :job_end_date, :end_date
      t.rename :job_position, :position
      t.rename :job_description, :description
    end
  end
end