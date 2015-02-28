class Itinerary < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  has_many :destinations, through: :companions
  has_many :companions
  has_many :users, through: :companions
end 
