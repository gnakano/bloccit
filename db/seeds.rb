require 'faker'

# Create Posts

def self.post
  if 
    Post.where(title: "Idempotence Seed", body: "This is the seeded data").blank?
  else
50.times do

  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
    end
  end
end
posts = Post.all

# Create Comments

def self.comment
  if 
    comment.where(post: "This is Idempotence Post", body: "This is the seeded data").blank?
  else
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
    end
  end
end



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"