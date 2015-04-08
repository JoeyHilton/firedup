class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :up_fname
      t.string :up_lname
      t.string :up_address
      t.string :up_city
      t.string :up_state
      t.integer :up_zip
      t.string :up_twitter
      t.date :up_birthdate
      t.integer :up_phone
      t.integer :up_mobilephone
      t.string :up_gender
      t.string :up_secondemail
      t.text :up_bio

      t.timestamps null: false
    end
  end
end
