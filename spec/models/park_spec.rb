require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "instance variables" do
    it ".average_ride_rating" do
      park1 = Park.create(
        name: "park 1 name",
        price: 50.00
      )
      park1.rides.create(
        name: "ride 1 name",
        rating: 1
      )
      park1.rides.create(
        name: "ride 2 name",
        rating: 2
      )
      park1.rides.create(
        name: "ride 3 name",
        rating: 3
      )

      expect(park1.average_ride_rating).to eq(2.0)
    end
  end
end
