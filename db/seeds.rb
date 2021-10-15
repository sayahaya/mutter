30.times do |i|
  User.create!(
    name: "test#{i}",
    email: "test#{i}@example.com",
    password: 12345678,
    password_confirmation: 12345678
  )
end