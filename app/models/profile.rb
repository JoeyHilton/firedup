class Profile < ActiveRecord::Base

  belongs_to :user

  has_many :jobs, dependent: :destroy
  has_many :certs, dependent: :destroy      
  has_many :educations, dependent: :destroy

  validates :up_city, presence: true
  validates :up_state, presence: true
  validates :up_zip, presence: true, numericality: { only_integer: true }
  validates :up_birthdate, presence: true
  validates :up_gender, presence: true

  GENDER = %w(Male Female)

  STATE = %w(Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware Florida 
            Georgia Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland 
            Massachusetts Michigan Minnesota Mississippi Missouri Montana Nebraska Nevada 
            New\ Hampshire New\ Jersey New\ Mexico New\ York North\ Carolina North\ Dakota 
            Ohio Oklahoma Oregon Pennsylvania Rhode\ Island South\ Carolina South\ Dakota Tennessee 
             Texas Utah Vermont Virginia Washington West\ Virginia Wisconsin Wyoming)

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