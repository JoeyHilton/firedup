

User.create(email: "test@test.com", password: "password", password_confirmation: "password")


9.times do 
  User.create(email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password")
end

# User.all.each do |user|
#   Profile.create(up_fname: Faker::Name.first_name,
#                  up_lname: Faker::Name.last_name,
#                  up_address: Faker::Address.street_address,
#                  up_city: Faker::Address.city,
#                  up_state: Faker::Address.state,
#                  up_zip: Faker::Address.zip,
#                  up_twitter: Faker::Name.first_name,
#                  up_birthdate: Faker::Date.backward(2000),
#                  up_phone: Faker::PhoneNumber.phone_number,
#                  up_mobilephone: Faker::PhoneNumber.phone_number,
#                  up_gender: "male",
#                  up_secondemail: Faker::Internet.email,
#                  up_bio: Faker::Lorem.sentence,
#                  user_id: user.id)
# end

# 10.times do
#   Job.create(job_company: Faker::Lorem.word,
#              job_start_date: Faker::Date.backward(800),
#              job_end_date: Faker::Date.backward(30),
#              job_position: Faker::Lorem.word,
#              job_description: Faker::Lorem.sentence,
#              profile_id: Profile.ids.sample)
# end

# 10.times do
#   Cert.create(cert_title: Faker::Lorem.word,
#               cert_startdate: Faker::Date.backward(365),
#               cert_expiredate: Faker::Date.forward(300),
#               cert_description: Faker::Lorem.sentence,
#               profile_id: Profile.ids.sample)
# end

# 10.times do
#   Education.create(edu_school: Faker::Lorem.word,
#                    edu_startdate: Faker::Date.backward(800),
#                    edu_enddate: Faker::Date.backward(30),
#                    edu_subject: Faker::Lorem.word,
#                    edu_description: Faker::Lorem.sentence,
#                    edu_degree: Faker::Lorem.word,
#                    profile_id: Profile.ids.sample)
# end
