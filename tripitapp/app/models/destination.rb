class Destination < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  has_many :itineraries, through: :companions
  has_many :users, through: :companions
end
