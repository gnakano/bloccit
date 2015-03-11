require 'faker'


# Create Advertisemtns

10.times do
Advertisement.create!(
  title: Faker::Internet.url('http://pagead2.googlesyndication.com') #=> "http://example.com/clotilde.swift" 
  )
end



# Create Posts

if Post.where(title: "Idempotence Seed",
  body: "This is the seeded data").blank?
  
50.times do
    
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
  end

Post.create!(:title => "Idempotence Seed",
  :body => "This is the seeded data")
end
   
posts = Post.all


# Create Comments

if Comment.where(post: posts.sample,
  body: "Commented Seeded data").blank?

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
    end
Comment.create!(:post => posts.sample,
  :body => "Commented Seeded data")
end



puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

