# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Creating a user"
User.destroy_all
Tour.destroy_all

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
  description: 'Fairies have landed on Belle Isle! The fairies invite you to explore and look for their fairy doors in a fun, interactive scavenger hunt. All of their doors are located on the grounds surrounding the Belle Isle Aquarium and Anna Scripps Whitcomb Conservatory. You’ll find the general whereabouts on the map, but it is up to you to find their exact locations.
  Each door is a nod to environmental stewardship and the connection fairies (and humans) feel to the world around them. As you discover the fairy doors, you can read about the inspiration behind each one by taking the corresponding number from the map and matching it with the numbered description below.',
  start_date: '2021/November/15',
  end_date: '2021/November/20',
  user: user,
  address: "Sharjah, UAE"
)
file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Green_winter.jpg/1024px-Green_winter.jpg')
tour1.photos.attach(io: file, filename: 'forest.jpg', content_type: 'image/jpg')

file = URI.open('https://live.staticflickr.com/3775/13506330494_d8a950d2e0_b.jpg')
tour1.photos.attach(io: file, filename: 'forest.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpJzhJCaPGcVzp9s3s0snth_gUEMzouMiTmg&usqp=CAU')
tour1.photos.attach(io: file, filename: 'forest.jpg', content_type: 'image/jpg')

tour1.user = user
tour1.save
p tour1

tour2 = Tour.new(
  title: 'Shelborne South Beach',
  category: 'Half-day Tours',
  price: 10,
  description: 'Look back and dream forward. Dating back to the 1940s, Shelborne South Beach exudes timeless luxury and elegance, with impeccable service, original Art Deco architecture, and a covetable address on Collins Avenue. The 250 guest accommodations blend vintage-chic furnishings and stunning views—lending an air of oceanside glamor. Our 30,000-square-foot event space comprises a grand ballroom, an executive boardroom, breakout rooms, an expansive terrace, and additional indoor and outdoor space. Meanwhile, our cafés, bars, and restaurants bring the freshest, boldest flavors of Miami Beach to our inspired oceanside dining establishments.',
  start_date: '2021/November/18',
  end_date: '2021/November/23',
  user: user,
  address: "Abu Dhabi, UAE"
)
file = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/beach-quotes-1559667853.jpg')
tour2.photos.attach(io: file, filename: 'beach.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBs2aYbp_8B0HStmEsIlOlmUYn4nnGL0uW5w&usqp=CAU')
tour2.photos.attach(io: file, filename: 'beach.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcd8VZ7_imPwShHtyzeGBX_a8C6GkIgbHtIA&usqp=CAU')
tour2.photos.attach(io: file, filename: 'beach.jpg', content_type: 'image/jpg')


tour2.user = user
tour2.save
p tour2

tour3 = Tour.new(
  title: 'Burj Khalifa Climb',
  category: 'Extreme',
  price: 20,
  description: 'Anyone with nerves of steel and Dhs350 to spare can head up to Burj Khalifa’s 148th floor. It’s a different story altogether getting to the very top of the world’s tallest building, a vertigo-inducing honour reserved for a select few. To showcase just how complex it actually is to get to the highest tip, the Burj Khalifa team have launched three videos on their Instagram page that take us on a day in the life of one of the building’s technicians as he prepares to check the lightning arrester. In case you were wondering, this is the device used on electrical power systems to protect the insulation and conductors of a building when lightning strikes. You can just imagine what an easy target the Burj Khalifa is for Mother Nature when a sporadic but very wild storm hits Dubai. Luckily, the world’s tallest building has a unique system in place which senses the charge in the air and generates an opposite charge to attract the lightning into it. That doesn’t mean the lightning arrester on the Burj Khalifa’s spire doesn’t require maintenance.',
  start_date: '2021/November/11',
  end_date: '2021/November/25',
  user: user,
  address: "Dubai Marina"
)
file = URI.open('https://www.izkiz.net/wp-content/uploads/2017/01/DSC_7356.jpg')
tour3.photos.attach(io: file, filename: 'bkclim.jpg', content_type: 'image/jpg')

file = URI.open('https://images.unsplash.com/photo-1534350752840-1b1b71b4b4fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
tour3.photos.attach(io: file, filename: 'bkclim.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-5-613J4AFTyQqpru8nczUhH-kHQfichDDg&usqp=CAU')
tour3.photos.attach(io: file, filename: 'bkclim.jpg', content_type: 'image/jpg')

tour3.user = user
tour3.save
p tour3

tour4 = Tour.new(
  title: 'Road trip',
  category: 'Bus Tours',
  price: 60,
  description: "Welcome to the city that has it all. Hop on our Dubai bus tour to experience a true fusion of traditional Arabian charm and futuristic dynamism. Enjoy panoramic views of Dubai's dramatic skyline, perfect sandy beaches and the world’s tallest building, Hop off to explore historical souks, forts and palaces, and enjoy ultra-chic dining and ambient nightlife. With Big Bus Dubai, you’ll taste it all.",
  start_date: '2021/November/23',
  end_date: '2021/November/24',
  user: user,
  address: "Burj Khalifa, Dubai"
)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDk_s0BOoOAwxJwVaTq_7Dhgc5naiIgQ2rQQ&usqp=CAU')
tour4.photos.attach(io: file, filename: 'roadtrip.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmxAMH9Gt_MVg_CKl_54Y4xoy-Jm4n7C2WcA&usqp=CAU')
tour4.photos.attach(io: file, filename: 'roadtrip.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5m9CoZ93I4Qd0T6aMAIW2USHYbFjKodKroA&usqp=CAU')
tour4.photos.attach(io: file, filename: 'roadtrip.jpg', content_type: 'image/jpg')

tour4.user = user
tour4.save
p tour4

tour5 = Tour.new(
  title: 'GO-KART',
  category: 'Theme Parks',
  price: 30,
  description: 'If you enjoy the thrill of the go-kart racetrack, head straight to Kartdrome. This is Dubai’s primary go-karting track at an impressive 1.2 kilometres. With indoor and outdoor circuits and a fleet of leisure karts, Kartdrome is a sure-fire way to get your adrenaline pumping. Enjoy some marvellous racing in a safe environment, suitable for those aged seven and up. The karts offer a comfortable driving position, top-level performance and handling. Fitted with Honda engines which ensure equal acceleration, visitors can take on the international standard circuit at high speeds. There are 17 corners, a tunnel and a bridge to test even skilled drivers. If you’re a beginner, you may like to book the ‘Arrive & Drive’ rental sessions, where you can try karting for fun. The indoor circuit also hosts kids parties, private lessons and karting camps.',
  start_date: '2021/December/2',
  end_date: '2021/December/15',
  user: user,
  address: "Downtown Dubai"
)
file =URI.open('https://curlytales.com/wp-content/uploads/2020/10/Gokart.jpg')
tour5.photos.attach(io: file, filename: 'gokart.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx6d36lpEMWetZb_xQophO4I1z7PVATpF7bg&usqp=CAU')
tour5.photos.attach(io: file, filename: 'gokart.jpg', content_type: 'image/jpg')

file = URI.open('https://media.istockphoto.com/photos/family-gokarts-picture-id801683778?b=1&k=20&m=801683778&s=170667a&w=0&h=BB7bXdQ7se7gkd8BT7kzSoCbSg5Jjqdg0rVhGy8T5as=')
tour5.photos.attach(io: file, filename: 'gokart.jpg', content_type: 'image/jpg')

tour5.user = user
tour5.save
p tour5

puts "Done with the tours"

tour6 = Tour.new(
  title: 'Dubai Marina Yacht Tour',
  category: 'Half-day Tours',
  price: 250,
  description: 'Enjoy a taste of A-lister life without the high price tag—or anything to organize on your part—on this shared deluxe yacht cruise off Dubai. All you need do is step aboard, lounge on deck, and watch Dubai’s skyline and sights such as the Atlantis The Palm glide by; all as you enjoy the cool breezes and either breakfast or a barbecue meal depending on your chosen time slot. Choose from a morning, afternoon, or sunset tour and experience Dubai from a luxury yacht without the price tag. Become a VIP as you enter the yacht, enjoy a delicious meal on board the vessel and cruise the waters around Dubai. Perfect for families, couples, or groups of friends, the spacious yacht provides plenty of room to relax, meet new people, or simply sit back and take in the sensational views. Cruise around Dubai in a luxury yacht Great views of the city’s famous buildings and landmarks Have a luxury experience without the high price tag Relax and enjoy a meal and soft drinks onboard
  Read more about Dubai Marina Yacht Tour with Breakfast or BBQ 2021',
  start_date: '2021/December/1',
  end_date: '2022/January/15',
  user: user,
  address: "Palm Jumeirah"
)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpFLzvld6QBmVNOnFvYqBYS39bxjhsxDa3GA&usqp=CAU')
tour6.photos.attach(io: file, filename: 'yacht.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB051kM_Jx-DzBEF6tKvNf11sCJYRxVnuIwA&usqp=CAU')
tour6.photos.attach(io: file, filename: 'gokart.jpg', content_type: 'image/jpg')

file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB051kM_Jx-DzBEF6tKvNf11sCJYRxVnuIwA&usqp=CAU')
tour6.photos.attach(io: file, filename: 'gokart.jpg', content_type: 'image/jpg')

tour6.user = user
tour6.save
p tour6

puts "Done with the tours"
