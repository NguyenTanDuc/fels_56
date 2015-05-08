# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |n|
  content = "English#{n+1}"
  Word.create!(content: content)
end

words = Word.order(:created_at).take(50)
4.times do |n|
  content = "Vietnamese"
  words.each {|word| word.answers.create! content: content, correct: n == 1}
end
