# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

# create a bike
4.times do
  Bike.create(
    name: Faker::Movies::StarWars.droid,
    capacity: (1..6).to_a.sample,
    price: (1..50).to_a.sample,
    owner: user,
    description: Faker::Movies::StarWars.quote
  )
end

puts "created #{Bike.count} bikes w/ description"

