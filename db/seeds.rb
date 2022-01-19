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
Player.destroy_all
# scrape = Scraper.new
players = PlayersHelper::getAllPlayers()
# puts players
# byebug
players.each do |player|
  Player.create!(player)
end

players_notes = PlayersHelper::getPlayerNotes()
p "created Player data: #{Player.count}"

#Seed data for PlayersNotes
Note.destroy_all
# scrape = Scraper.new
players_notes = PlayersHelper::getPlayerNotes()
# puts players
# byebug
players_notes.each do |player_note|
  Note.create!(player_note)
end

p "created PlayerNotes data #{Note.count}"

#seed for subscription
s1 = Subscription.create({
  user_id: 1, player_id: 2
})
s2 = Subscription.create({
  user_id: 2, player_id: 1
})
s3 = Subscription.create({
  user_id: 3, player_id: 1
})
s4 = Subscription.create({
  user_id: 4, player_id: 2
})

