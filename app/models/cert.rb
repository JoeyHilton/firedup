class Cert < ActiveRecord::Base

  belongs_to :user

  validates :cert_title, presence: true
  validates :cert_startdate, presence: true
  validates :cert_expiredate, presence: true

  

end

    # certs schema------------------------------
    # t.string   "cert_title"
    # t.date     "cert_startdate"
    # t.date     "cert_expiredate"
    # t.text     "cert_description"
    # t.datetime "created_at",       null: false
    # t.datetime "updated_at",       null: false