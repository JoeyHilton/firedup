class Ce < ActiveRecord::Base

  belongs_to :user

  validates :topic, presence: true
  validates :date, presence: true
  validates :hours, presence: true
  validates :classtype, presence: true

  CLASSTYPE = %w(Live Online)

  has_attached_file :file
  # has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", xlarge: "300x300"}
  # validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png 
  #                                                                     application/pdf application/msword 
  #                                                                     application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  
end

    # t.string   "topic"
    # t.date     "date"
    # t.integer  "hours"
    # t.string   "classtype"
    # t.text     "notes"
    # t.integer  "user_id"

