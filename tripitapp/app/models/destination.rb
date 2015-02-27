class Destination < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :itineraries
  has_many :users, through: :companions
end
