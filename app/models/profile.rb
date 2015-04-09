class Profile < ActiveRecord::Base

  belongs_to :user

  validates :up_city, presence: true
  validates :up_state, presence: true
  validates :up_zip, presence: true, numericality: { only_integer: true }
  validates :up_birthdate, presence: true
  validates :up_gender, presence: true

  
end

    # Profile schema-------------------------
    # t.string   "up_fname"
    # t.string   "up_lname"
    # t.string   "up_address"
    # t.string   "up_city"
    # t.string   "up_state"
    # t.integer  "up_zip"
    # t.string   "up_twitter"
    # t.date     "up_birthdate"
    # t.integer  "up_phone"
    # t.integer  "up_mobilephone"
    # t.string   "up_gender"
    # t.string   "up_secondemail"
    # t.text     "up_bio"
    # t.datetime "created_at",     null: false
    # t.datetime "updated_at",     null: false