# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(username:  "muffins",
#              email: "example@example.org",
#              password:              "gangstar1",
#              password_confirmation: "gangstar1")

15.times do |n|
  name  = Faker::Internet.user_name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end