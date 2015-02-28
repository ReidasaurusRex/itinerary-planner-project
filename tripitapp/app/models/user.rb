class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :joins
  has_many :itineraries, through: :joins
  has_many :destinations, through: :joins
end
 
