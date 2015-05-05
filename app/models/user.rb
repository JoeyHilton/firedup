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
      user.first_name = auth.info.first_name   # assuming the user model has a name
      user.last_name = auth.info.last_name   # assuming the user model has a name
      # user.image.url = auth.info.image # assuming the user model has an image
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

  # validates :birthdate   
  validates_format_of :zip, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234", :allow_blank => true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }, :allow_blank => true
  validates :mobile_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }, :allow_blank => true

  # has_one :profile, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :certs, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :jboards, dependent: :destroy
  has_many :ces, dependent: :destroy
  has_many :tasks, dependent: :destroy

  has_attached_file :image, styles: { icon: "32x32!", small: "64x64", med: "100x100", large: "200x200" },
                    :default_url => "/images/:style/missing.png"


  # for paperclip
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # for socialization
  acts_as_follower
  acts_as_followable

  # for message model
  has_many :messages, dependent: :destroy
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

