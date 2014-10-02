# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

pizzapizza = Restaurant.create(:name => 'pizzapizza', :cuisine => 'p')
pizzapizza.reviews.create(rating: 1, text: 'appauling')
pizzapizza.reviews.create(rating: 2, text: 'meh')
pizzapizza.reviews.create(rating: 3, text: 'aight')
pizzapizza.reviews.create(rating: 4, text: 'mmmmm')
pizzapizza.reviews.create(rating: 5, text: 'WOW')

chickencottage = Restaurant.create(:name => 'chickencottage', :cuisine => 'filth')
chickencottage.reviews.create(rating: 1, text: 'fuck that')
chickencottage.reviews.create(rating: 2, text: 'no')
chickencottage.reviews.create(rating: 1, text: 'uuuuurrrrrrgh')
chickencottage.reviews.create(rating: 1, text: 'yuck')
chickencottage.reviews.create(rating: 2, text: 'hmmm nah')