include Faker

#Create Users

  5.times do
    user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
    )
  end
  users = User.all

# Create Wikis
  15.times do
    Wiki.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      user: users.sample,
      private: false
    )
  end
  wikis = Wiki.all

  # Create an admin member
  admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
  )

  #Create a standard member
  member = User.create!(
  email:    'member@example.com',
  password: 'helloworld'
  )

  #Create a premium member
  premium = User.create!(
    email:    'premium@example.com',
    password: 'helloworld',
    role:     'premium'
  )

  #2nd Premium member
premium_2 = User.create!(
  email:    'premium2@example.com',
  password: 'helloworld',
  role:     'premium'
  )

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."
