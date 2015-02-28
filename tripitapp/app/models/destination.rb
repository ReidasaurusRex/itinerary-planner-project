class Destination < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  has_many :joins
  has_many :itineraries, through: :joins
  has_many :users, through: :joins
end
 
