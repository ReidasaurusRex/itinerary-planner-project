class Destination < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :itineraries
end
