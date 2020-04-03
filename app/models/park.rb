class Park < ApplicationRecord
  validates_presence_of :name, :price
  has_many :rides

  def average_ride_rating
    rides.average(:rating)
  end
end
