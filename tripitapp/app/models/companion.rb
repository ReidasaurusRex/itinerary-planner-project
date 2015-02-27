class Companion < ActiveRecord::Base
  belongs_to :itineraries
  belongs_to :users
end
