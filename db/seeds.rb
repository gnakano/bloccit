require 'faker'

# Create Users
5.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

# Note: by calling 'User.new' instead of 'create'
# we create an instance of User which isn't immediately saved to the database

# The 'skip_confirmatino!' method sets the confirmed-at' attribute
# to avoid triggering an confrimation email when the User is saved.

# The 'save method then saves this User to teh database.

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
    user: users.sample,
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
    # user: users.sample, # we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
    end
Comment.create!(:post => posts.sample,
  :body => "Commented Seeded data")
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'genjinakano@hotmail.com',
  password: 'Chargers21!'
  )




puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

