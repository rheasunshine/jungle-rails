# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

## PRODUCTS

puts "Finding or Creating Products ..."

prod1 = Product.find(1)
prod5 = Product.find(5)
prod8 = Product.find(8)

## PRODUCTS

puts "Re-creating Reviews ..."

Review.destroy_all

prod1.reviews.create!({
  user_id: 1,
  description: 'Classy AND Sassy, this shirt has me lookin tastier than Molasseeee(s)',
  rating: 5
})

prod5.reviews.create!({
  user_id: 1,
  description: 'These shoes have made my job so much better in Russia. I fit in perfectly. No one can ever recognize me because the shoes make me Russian. I wear these shoes for work every single day. I think it\'s important that I introduce myself so you understand how relevant my review is. I\'m Kromobopulos Michael. I\'m an assassin. Listen, if you ever need anybody murdered, please give me a call. I\'m very discreet. I have no code of ethics. I will kill anyone, anywhere children, animals, old people doesn\'t matter. I just love killing.',
  rating: 5
})

prod8.reviews.create!({
  user_id: 1,
  description: 'This hotdog slicer works on everything and anything... EXCEPT FOR HOTDOGS. IT\'S A SCAM. DON\'T BUY THIS HOTDOG SLICER IF YOU\'RE TRYING TO SLICE HOTDOGS. YOU CAN SLICE POLISH SAUSAGE, ITALIAN SAUSAGE, AMERICAN SAUSAGE, MEXICAN SAUSAGE, GERMAN SAUSAGE, CANADIAN SAUSAGE, INDIAN SAUSAGE, RAW SAUSAGE, COOKED SAUSAGE, OLD SAUSAGE, NEW SAUSAGE, AND MORE. BUT NOT HOTDOGS. DON\'T WASTE YOUR MONEY!!!!',
  rating: 1
})


puts "DONE!"
