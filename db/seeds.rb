# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.destroy_all
Account.destroy_all
Order.destroy_all
OrderItem.destroy_all
Product.destroy_all
Comment.destroy_all

testAdmin = User.create!(username: 'tadmin',
                       email: 'tadmin@gmail.com',
                       password: '1234567',
                       admin: true
)

testUser = User.create!(username: 'tuser1',
                       email: 'tuser1@gmail.com',
                       password: '1234567',
                       admin: false
)

5.times do |j|
  randPrice = (randPrice = rand(50..200) + (rand(0.01..0.99))).round(2)
  someProduct = Product.create!(name: Faker::HitchhikersGuideToTheGalaxy.planet,
                            description: Faker::HitchhikersGuideToTheGalaxy.quote,
                            price: randPrice,
                            image_url: 'http://lorempixel.com/200/200/abstract'

  )
end




p "Created #{User.count} users"
p "Created #{Account.count} accounts"
p "Created #{Order.count} order items"
p "Created #{OrderItem.count} order items"
p "Created #{Product.count} products"
p "Created #{Comment.count} comments"
