class Ce < ActiveRecord::Base

  belongs_to :user

  validates :topic, presence: true
  validates :date, presence: true
  validates :hours, presence: true
  validates :classtype, presence: true

  CLASSTYPE = %w(Live Online)
  
end

    # t.string   "topic"
    # t.date     "date"
    # t.integer  "hours"
    # t.string   "classtype"
    # t.text     "notes"
    # t.integer  "user_id"

