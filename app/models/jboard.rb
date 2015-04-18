class Jboard < ActiveRecord::Base

  belongs_to :user

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
