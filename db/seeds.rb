# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
u = User.new(
  email: "seed.mcseed_1@gmail.com",
  password: '12341234'
)
u.save!(:validate => false)

File.open('db/genres').each do |line|
  Genre.create(body: line.squish)
end
