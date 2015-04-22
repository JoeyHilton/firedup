class Message < ActiveRecord::Base
  belongs_to :user
  # validates :user_id, presence: true

  belongs_to :sender, class_name: "User", foreign_key: "sender_id" 
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id" 
  belongs_to :archived, class_name: "User", foreign_key: "archived"
end
