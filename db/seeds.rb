User.create(email: "test@test.com", password: "password", password_confirmation: "password")


9.times do 
  User.create(email: Faker::Internet.email,
              name: Faker::Name.name,
              password: "password",
              password_confirmation: "password")
end




10.times do
  Profile.create(up_fname: Faker::Name.first_name,
                 up_lname: Faker::Name.last_name,
                 up_address: Faker::Address.street_address,
                 up_city: Faker::Address.city,
                 up_state: Faker::Address.state,
                 up_zip: Faker::Address.zip,
                 up_twitter: Faker::Name.first_name,
                 up_birthdate: Faker::Date.backward(2000),
                 up_phone: Faker::PhoneNumber.phone_number,
                 up_mobilephone: Faker::PhoneNumber.phone_number,
                 up_gender: "male"
                 up_secondemail: Faker::Internet.email,
                 up_bio: Faker::Lorem.sentence
                 user_id: User.ids.sample)
end