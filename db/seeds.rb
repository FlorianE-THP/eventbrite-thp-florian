# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

User.destroy_all
Event.destroy_all
Attendance.destroy_all

1.times do
  e = Faker::Name.first_name
  User.create!(email: "#{e}@yopmail.com", description: Faker::Lorem.sentence(word_count: 3), first_name: e, last_name: Faker::Name.last_name, password: "testing")
end

5.times do
  Event.create!(start_date: Faker::Date.forward(days: 23), duration: rand(1..40) * 5, title: Faker::Lorem.sentence(word_count: 5), description: Faker::Lorem.sentence(word_count: 10), price: rand(1..1000), location: Faker::Address.city, organizer_id: User.ids.sample)
end

5.times do
  Attendance.create!(stripe_customer_id: Faker::Lorem.sentence(word_count: 1), user_id: User.ids.sample, event_id: Event.ids.sample)
end
