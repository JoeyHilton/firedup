class Msearch < ActiveRecord::Base

  def search_members

    users = User.all
    users = users.where("first_name ILIKE ?", "%#{first_name}%") if first_name.present?
    users = users.where("last_name ILIKE ?", "%#{last_name}%") if last_name.present?
    users = users.where("city LIKE ?", city) if city.present?
    users = users.where("state LIKE ?", state) if state.present?
    

    return users

  end
end
