# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating a user"
Tour.destroy_all
User.destroy_all

user = User.create(
  email: "zuckerberg@gmail.com",
  password: 'ilovemeta',
  first_name: 'Mark',
  last_name: 'Zuckerberg',
  birth_date: '2000/November/23',
  phone_number: "0556743434"
)

p user
puts "Done with the users"
p "-" * 20
puts "Creating the tours"

tour1 = Tour.new(
  title: 'Faena Fairy Search',
  category: 'Extreme',
  price: 50,
  description: 'You will hunt fairies.',
  start_date: '2021/November/23',
  end_date: '2021/November/24',
  user: user
)
tour1.user = user
tour1.save
p tour1

tour2 = Tour.new(
  title: 'Shelborne South Beach',
  category: 'Half-day Tours',
  price: 10,
  description: 'Frolick at the beach!',
  start_date: '2021/November/23',
  end_date: '2021/November/23',
  user: user
)
tour2.user = user
tour2.save
p tour2

tour3 = Tour.new(
  title: 'Burj Khalifa Climb',
  category: 'Extreme',
  price: 20,
  description: 'Climb to the top!',
  start_date: '2021/November/23',
  end_date: '2021/November/24',
  user: user
)
tour3.user = user
tour3.save
p tour3

tour4 = Tour.new(
  title: 'Road trip',
  category: 'Bus Tours',
  price: 60,
  description: 'Travel Dubai.',
  start_date: '2021/November/23',
  end_date: '2021/November/24',
  user: user
)
tour4.user = user
tour4.save
p tour4

tour5 = Tour.new(
  title: 'GO-KART',
  category: 'Theme Parks',
  price: 30,
  description: 'Get an adrenaline rush!',
  start_date: '2021/November/23',
  end_date: '2021/November/24',
  user: user
)
tour5.user = user
tour5.save
p tour5

puts "Done with the tours"
