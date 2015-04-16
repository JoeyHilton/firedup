class Post < ActiveRecord::Base

  belongs_to :user

  validates :content, presence: true
  validates :share_with, presence: true

  SHARES = %w(Everyone Connections)

end

  # t.integer  "user_id"
  # t.text     "content"
  # t.string   "share_with"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false