15.times do
  user = User.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  username: Faker::Internet.user_name(separators=%w(. _)),
  email: Faker::Internet.free_email,
  password: Faker::Internet.password(8)
  )
end
