class Ride < ApplicationRecord
  validates_presence_of :name, :park_id
  validates :rating, inclusion: 1..10
  belongs_to :park
end
