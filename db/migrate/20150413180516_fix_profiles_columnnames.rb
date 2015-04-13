class FixProfilesColumnnames < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.rename :up_fname, :first_name
      t.rename :up_lname, :last_name
      t.rename :up_address, :address
      t.rename :up_city, :city
      t.rename :up_state, :state
      t.rename :up_zip, :zip
      t.rename :up_twitter, :twitter
      t.rename :up_birthdate, :birthdate
      t.rename :up_phone, :phone
      t.rename :up_mobilephone, :mobile_phone
      t.rename :up_gender, :gender
      t.rename :up_secondemail, :secondary_email
      t.rename :up_bio, :bio
    end
  end
end

