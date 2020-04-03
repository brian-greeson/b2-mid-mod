require "rails_helper"

RSpec.describe "when a user visits the parks show page: " do
  it "See name and price of admissions for that amusement park" do
    park1 = Park.create(
      name: "park 1 name",
      price: 50.00
    )
    ride1 = park1.rides.create(
      name: "ride 1 name",
      rating: 1
    )
    ride2 = park1.rides.create(
      name: "ride 2 name",
      rating: 2
    )
    ride3 = park1.rides.create(
      name: "ride 3 name",
      rating: 3
    )

    within "section.park-details" do
      expect(page).to have_content(park1.name)
      expect(page).to have_content("Admissions: $50.00")
    end
    within "section.park-rides-list" do
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to have_content(ride3.name)
    end
    within "section.park-stats" do
      expect(page).to have_content("Average Thrill Rating of Rides: 2.0/10")
    end

  end


end
