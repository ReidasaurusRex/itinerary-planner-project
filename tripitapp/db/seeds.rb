# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Joins.destroy_all
Destination.destroy_all
Itinerary.destroy_all
Review.destroy_all
User.destroy_all

dave = User.create(:first_name => "Dave", :last_name => "Smith", :email => "DSmith@gmail.com", :username => "SmithD", :password => "1234")
sarah = User.create(:first_name => "Sarah", :last_name => "Smith", :email => "SSmith@gmail.com", :username => "SmithS", :password => "1234")
jimmy = User.create(:first_name => "Jimmy", :last_name => "Smith", :email => "JSmith@gmail.com", :username => "SmithJ", :password => "1234")
egbhert = User.create(:first_name => "Egbhert", :last_name => "Smith", :email => "ESmith@gmail.com", :username => "SmithE", :password => "1234")
tammy = User.create(:first_name => "Tammy", :last_name => "Smith", :email => "TSmith@gmail.com", :username => "SmithT", :password => "1234")

rome = Destination.create(:location => "Italy", :name => "Rome", :date => "2015-04-11")
moscow = Destination.create(:location => "Russia", :name => "Moscow", :date => "2015-10-11")
greenville = Destination.create(:location => "NC", :name => "Greenville", :date => "2015-04-11")
hillsboro = Destination.create(:location => "NC", :name => "Hillsboro", :date => "2015-04-20")
morhead = Destination.create(:location => "NC", :name => "Morhead", :date => "2015-05-01")
sanfrancisco = Destination.create(:location => "CA", :name => "San Francisco", :date => "2015-04-10")

europe = Itinerary.create(:start_date => "2015-04-10", :end_date => "2016-04-09")
north_carolina = Itinerary.create(:start_date => "2015-04-10", :end_date => "2015-05-10")

nc_review1 = Review.create(:content => "NC was cool when I was a kid, now its totally lame")
nc_review2 = Review.create(:content => "Best trip ever! We totally saw things.")
dave_review = Review.create(:content => "Dave is my best bro. We totally got drunk on the trip. DeltaCappaPhi!")
tammy_review = Review.create(:content => "Traveling with Tammy was like traveling with a wet blanket. Nothing was good enough for her.")
rome_review = Review.create(:content => "Rome is like LA with ruins.")

join.creator_id << dave
join.itinerary_id << europe
join.destination_id << sanfrancisco
join.destination_id << rome
join.destination_id << moscow

itinerray[0].destination[0].user << dave
itinerray[0].destination[1].user << dave
itinerray[0].destination[2].user << dave
itinerray[0].destination[0].user << sarah
itinerray[0].destination[0].user << egbhert
itinerray[0].destination[1].user << egbhert

join.createor_id << jimmy
join.itinerary_id << north_carolina
join.destination_id << sanfrancisco
join.destination_id << greenville
join.destination_id << morhead
join.destination_id << hillsboro

itinerray[1].destination[0].user << tammy
itinerray[1].destination[2].user << tammy
