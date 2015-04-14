class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # --------  above this line for devise only ----------------      

  # has_one :profile, dependent: :destroy
  has_many :educations
  has_many :jobs
  has_many :certs
  has_attached_file :image, styles: { icon: "32x32", small: "64x64", med: "100x100", large: "200x200" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

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
end

