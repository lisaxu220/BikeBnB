# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

# create a user
User.destroy_all
Bike.destroy_all

puts "clean database"

user = User.create(
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: "123456"
)

20.times do
  file = URI.open('https://source.unsplash.com/featured/?{bike},{bicycle}')
    bike = Bike.create(
      name: Faker::Movies::StarWars.droid,
      capacity: (1..6).to_a.sample,
      price: (1..50).to_a.sample,
      owner_id: user.id,
      description: Faker::Lorem.paragraph
    )
  bike.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
end

puts "created #{Bike.count} bikes w/ description"
