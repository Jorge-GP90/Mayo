10.times do |n|
    user_name = Faker::Movies::StarWars.character
    email = Faker::Internet.email
    password = "password"
    User.create!(user_name: user_name,
                 email: email,
                 password: password,
                 )
end