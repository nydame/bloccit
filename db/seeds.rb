require 'random_data'

# Create Posts
50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

posts = Post.all

# Create Comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

# Create Questions
20.times do
    random_question = RandomData.random_sentence.split(".").join("")
    Question.create!(
        title: random_question + '?',
        body: RandomData.random_paragraph
    )
end

puts "Seeding finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
