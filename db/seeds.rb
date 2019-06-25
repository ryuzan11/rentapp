# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"



CSV.foreach('db/csv/city.csv') do |row|
  City.create(prefecture_id: row[0], city_cd: row[1], city_name: row[2])
end


