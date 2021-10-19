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

users = User.all
user = users.first
following = users[2..30]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }