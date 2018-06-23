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

# Create unique Post
unique_post = Post.find_or_create_by!(
    title: "I Am Truly Unique!",
    body: "Aenean nec lacus vestibulum, blandit elit ut, dictum augue. Etiam consequat varius placerat."
)

def number_of_unique_posts(standard)
    unique = Post.pluck(:title).select do |title|
        title == standard
    end
    unique.count

end

# Create unique Comment associated with the unique Post
Comment.find_or_create_by!(
    post: unique_post,
    body: "I would like to make a unique comment."
)

def number_of_unique_comments(standard)
    unique = Comment.pluck(:body).select do |body|
        body == standard
    end
    unique.count
end

puts "Seeding finished"
puts "#{Post.count} posts created"
puts "The number of posts entitled 'I Am Truly Unique!' is #{number_of_unique_posts('I Am Truly Unique!')}."
puts "#{Comment.count} comments created"
puts "The number of comments that say 'I would like to make a unique comment.' is #{number_of_unique_comments('I would like to make a unique comment.')}."
