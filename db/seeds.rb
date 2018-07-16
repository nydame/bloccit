require 'random_data'

# Create Users ()
5.times do
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end

# Create another member, except with know credentials
member1 = User.create!(
    name: "Member One",
    email: "member@bloc.io",
    password: "memberone"
)

# Create an admin user with known credentials
admin1 = User.create!(
    name: "Admin One",
    email: "admin@bloc.io",
    password: "adminone",
    role: "admin"
)

users = User.all
# Create Topics
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end

topics = Topic.all

# Create Posts
50.times do
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end

posts = Post.all

# Create Comments
100.times do
    Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seeding finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
