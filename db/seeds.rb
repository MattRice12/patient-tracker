# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "Matt", email: "matt@example.com", password: "password")

months = %w(January February March April May June July August September October November December)

months.each do |month|
  Month.create!(name: month)
end

Date.new(2017, 1, 1).upto(Date.new(2017, 12, 31)).each do |date|
  case date.strftime("%m")
  when "01"
    Day.create!(user_id: user, month: Month.find(1), date: date)
  when "02"
    Day.create!(user_id: user, month: Month.find(2), date: date)
  when "03"
    Day.create!(user_id: user, month: Month.find(3), date: date)
  when "04"
    Day.create!(user_id: user, month: Month.find(4), date: date)
  when "05"
    Day.create!(user_id: user, month: Month.find(5), date: date)
  when "06"
    Day.create!(user_id: user, month: Month.find(6), date: date)
  when "07"
    Day.create!(user_id: user, month: Month.find(7), date: date)
  when "08"
    Day.create!(user_id: user, month: Month.find(8), date: date)
  when "09"
    Day.create!(user_id: user, month: Month.find(9), date: date)
  when "10"
    Day.create!(user_id: user, month: Month.find(10), date: date)
  when "11"
    Day.create!(user_id: user, month: Month.find(11), date: date)
  when "12"
    Day.create!(user_id: user, month: Month.find(12), date: date)
  end
end

1000.times do
  Insured.create!(day_id: rand(1..365))
end
