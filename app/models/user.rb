class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # --------  above this line for devise only ----------------      

  has_one :profile, dependent: :destroy
  has_many :educations, through: :profile
  has_many :jobs, through: :profile
  has_many :certs, through: :profile


end

