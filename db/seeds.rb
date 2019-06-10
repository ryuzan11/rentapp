# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/csv/building_type.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  BuildingType.create(:building_type => row[0])
end

CSV.foreach('db/csv/construction.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Construction.create(:construction => row[0])
end

CSV.foreach('db/csv/layout.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Layout.create(:layout => row[0])
end

CSV.foreach('db/csv/old.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Old.create(:old => row[0])
end

CSV.foreach('db/csv/walk_time.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  WalkTime.create(:walk_time => row[0])
end

CSV.foreach('db/csv/prefecture.csv') do |row|
  Prefecture.create(pref_name: row[0])
end

CSV.foreach('db/csv/city.csv') do |row|
  City.create(prefecture_id: row[0], city_cd: row[1], city_name: row[2])
end
