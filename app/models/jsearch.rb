class Jsearch < ActiveRecord::Base

  def search_jboards

  Jboards = Jboard.all

  jboards = jboards.where("name like ?", "%#{keywords}%") if keywords.present?
  jboards = jboards.where("category like ?", category) if category.present?
  jboards = jboards.where("State ?", state) if state.present?
  jboards = jboards.where("City ?", city) if city.present?
  jboards = jboards.where("Agency ?", agency) if agency.present?

  return jboards

  end


end
