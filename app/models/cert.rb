class Cert < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :expire_date, presence: true

end
