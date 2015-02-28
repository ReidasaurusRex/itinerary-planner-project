class Itinerary < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  has_many :destinations, through: :joins
  has_many :joins
  has_many :users, through: :joins
end 
