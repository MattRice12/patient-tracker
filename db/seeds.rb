# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Matt", email: "matt@example.com", password: "password")
User.create!(name: "Mooty", email: "mooty@example.com", password: "password")
User.create!(name: "Mooty", email: "tooty@example.com", password: "password")
User.create!(name: "Mooty", email: "footy@example.com", password: "password")
User.create!(name: "Mooty", email: "dooty@example.com", password: "password")
User.create!(name: "Mooty", email: "sooty@example.com", password: "password")
User.create!(name: "Mooty", email: "maooty@example.com", password: "password")
User.create!(name: "Mooty", email: "moloty@example.com", password: "password")
User.create!(name: "Mooty", email: "moopty@example.com", password: "password")
User.create!(name: "Mooty", email: "mootpy@example.com", password: "password")
User.create!(name: "Mooty", email: "mootyp@example.com", password: "password")
User.create!(name: "Mooty", email: "amooty@example.com", password: "password")
User.create!(name: "Mooty", email: "abmooty@example.com", password: "password")
User.create!(name: "Mooty", email: "acmooty@example.com", password: "password")
User.create!(name: "Mooty", email: "admooty@example.com", password: "password")
User.create!(name: "Mooty", email: "aemooty@example.com", password: "password")
User.create!(name: "Mooty", email: "afmooty@example.com", password: "password")
User.create!(name: "Mooty", email: "agmooty@example.com", password: "password")
User.create!(name: "Mooty", email: "ahmooty@example.com", password: "password")

1000.times do
  Insured.create!(day_id: rand(1..365))
end

300.times do
  Uninsured.create!(day_id: rand(1..365))
end
