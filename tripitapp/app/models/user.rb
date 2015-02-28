class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, as: :reviewable
  has_many :companions
  has_many :itineraries, through: :companions
  has_many :destinations, through: :companions
end
 
