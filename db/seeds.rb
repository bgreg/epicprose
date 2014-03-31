# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#    Mayor.create(name: 'Emanuel', city: cities.first)
#
#   to relaod image_list: curl -sL http://imgur.com/gallery/random | grep e_sr | cut -d\" -f4'
#   to grab from a subreddit: curl -sL https://imgur.com/r/pics | grep '<img alt="" src="' | cut -d\" -f4 | sed 's/\/\//http:\/\//'
#
unless User.where(email: "seed.mcseed_1@gmail.com").first
  u = User.new( email: "seed.mcseed_1@gmail.com", password: '12341234')
  u.save!(validate: false)
end

File.open('db/genres').each do |line|
  Category.create(body: line.squish)
end

File.open('db/image_list').each do |line|
  Image.create(uri: line.squish)
end
