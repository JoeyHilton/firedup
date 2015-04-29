class Task < ActiveRecord::Base
  
  belongs_to :user



  TIMES = %w('4:00 am' '4:15 am' 4:30)

  CATEGORY = %w(Meeting ToDo Call Email Follow\ Up Lunch)



end
