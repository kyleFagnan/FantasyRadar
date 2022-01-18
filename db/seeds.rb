# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "Seeding Data ..."
#Seed data for users
user1 = User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.cell_phone,
  notification_type: "EMAIL"
})

user2 = User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.cell_phone,
  notification_type: "TEXT"
})
user3 = User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.cell_phone,
  notification_type: "EMAIL"
})
user4 = User.create!({
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  phone_number: Faker::PhoneNumber.cell_phone,
  notification_type: "TEXT"
})
#Seed data for Players
player1 = Player.create({
  player_name: Faker::Name.first_name
})
player2 = Player.create({
  player_name: Faker::Name.first_name
})
# player3 = Player.create({
#   player_name: Faker::Name.first_name
# })
# player4 = Player.create({
#   player_name: Faker::Name.first_name
# })

#seed for subscription

# s1 = Subscription.create({
#   user: user1, player: player1
# })
# s2 = Subscription.create({
#   user: user2, player: player2
# })
# s3 = Subscription.create({
#   user: user3, player: player2
# })
# s4 = Subscription.create({
#   user: user4, player: player1
# })

