class Cert < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :expire_date, presence: true

  has_attached_file :attachment
  # has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", xlarge: "300x300"}
  # validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png 
  #                                                                     application/pdf application/msword 
  #                                                                     application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
