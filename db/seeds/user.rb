puts 'Start inserting seed "users" ...'
10.times do
  user = User.create(
    user_name: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: '12345678',
    password_confirmation: '12345678'
  )
  puts "user#{user.id} has created!"
end
