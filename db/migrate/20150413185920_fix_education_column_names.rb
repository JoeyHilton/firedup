class FixEducationColumnNames < ActiveRecord::Migration
  def change
    change_table :educations do |t|
      t.rename :edu_school, :school
      t.rename :edu_startdate, :start_date
      t.rename :edu_enddate, :end_date
      t.rename :edu_subject, :subject
      t.rename :edu_description, :description
      t.rename :edu_degree, :degree
    end
  end
end