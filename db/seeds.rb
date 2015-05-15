5.times do |n|
  name = "Category#{n+1}"
  Category.create!(name: name)
end

categories = Category.all
30.times do |n|
  content = "English#{n+1}"
  categories.each {|category| category.words.create! content: content}
end

words = Word.order(:created_at).all
4.times do |n|
  content = "Vietnamese#{n+1}"
  words.each {|word| word.answers.create! content: content, correct: n == 1}
end

User.create!(name: 'Framgia E-Learning System 56 Administrator',
             email: 'framgia.elearning.system.56@gmail.com',
             password: '08011992',
             password_confirmation: '08011992',
             level: 1,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  User.create!(name: Faker::Name.name,
               email: "example-#{n+1}@framgia.elearning.system.56.com",
               password: 'password',
               password_confirmation: 'password',
               level: 2,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow followed}
followers.each {|follower| follower.follow user}
