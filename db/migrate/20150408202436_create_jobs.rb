class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_company
      t.date :job_start_date
      t.date :job_end_date
      t.string :job_position
      t.text :job_description

      t.timestamps null: false
    end
  end
end
