class Itinerary < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  has_many :destinations
  has_many :users, through: :companions
end
