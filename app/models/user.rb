class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # --------  above this line for devise only ----------------      

  # has_one :profile, dependent: :destroy
  has_many :educations
  has_many :jobs
  has_many :certs
  has_many :posts
  has_many :jboards

  has_attached_file :image, styles: { icon: "32x32", small: "64x64", med: "100x100", large: "200x200" },
                    :default_url => "/images/:style/missing.png"


  # for paperclip
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # for socialization
  acts_as_follower
  acts_as_followable

  # for message model
  has_many :messages
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id" 
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
 
  
  # validates :city, presence: true
  # validates :state, presence: true
  # validates :zip, presence: true, numericality: { only_integer: true }
  # validates :birthdate, presence: true
  # validates :gender, presence: true

  GENDER = %w(Male Female)

  STATE = %w(Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware Florida 
            Georgia Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland 
            Massachusetts Michigan Minnesota Mississippi Missouri Montana Nebraska Nevada 
            New\ Hampshire New\ Jersey New\ Mexico New\ York North\ Carolina North\ Dakota 
            Ohio Oklahoma Oregon Pennsylvania Rhode\ Island South\ Carolina South\ Dakota Tennessee 
             Texas Utah Vermont Virginia Washington West\ Virginia Wisconsin Wyoming)


  # after_save {self.profile.create}

  def has_new_messages?
    received_messages = self.received_messages
    received_messages.each do |message|
      return true if message.viewed == false
    end
    false
  end

  
end

