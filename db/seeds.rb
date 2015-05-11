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
