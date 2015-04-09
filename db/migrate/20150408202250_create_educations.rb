class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :edu_school
      t.date :edu_startdate
      t.date :edu_enddate
      t.string :edu_subject
      t.text :edu_description
      t.string :edu_degree

      t.timestamps null: false
    end
  end
end
