30.times do |i|
  User.create!(
    name: "test#{i}",
    email: "test#{i}@example.com",
    password: 12345678,
    password_confirmation: 12345678
  )
end

users = User.order(:created_at).take(5)
50.times do |i|
  users.each { |user| user.mutters.create!(content: "test#{i}")}
end