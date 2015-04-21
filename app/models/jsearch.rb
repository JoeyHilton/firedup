class Jsearch < ActiveRecord::Base

  def search_jboards

    jboards = Jboard.all

    # jboards = jboards.where("keywords LIKE ?", "%#{keywords}%") if keywords.present?
    jboards = jboards.where("category LIKE ?", category) if category.present?
    jboards = jboards.where("state LIKE ?", state) if state.present?
    jboards = jboards.where("city ILIKE ?", "%#{city}%") if city.present?
    jboards = jboards.where("agency ILIKE ?", "%#{agency}%") if agency.present?

    return jboards

  end


end
