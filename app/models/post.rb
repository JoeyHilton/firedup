class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200", xlarge: "400x400" }

  validates :content, presence: true
  validates :share_with, presence: true

  validates_attachment :image, :size => { :in => 0..1000.kilobytes }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  SHARES = %w(Everyone Connections)

end

  # t.integer  "user_id"
  # t.text     "content"
  # t.string   "share_with"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false