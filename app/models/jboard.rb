class Jboard < ActiveRecord::Base

  belongs_to :user

  validates_format_of :zip, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234", :allow_blank => true
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }, :allow_blank => true

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  CATEGORY = %w(Chief Investigation Dispatch EMT Paramedic Firefighter Firefighter/EMT Firefighter/Paramedic
              Training Wildland Administration Other)


end
