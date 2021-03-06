require "rails_helper"

RSpec.describe "when a user visits the mechanics show page: " do
  it "See their name, years of experience, and names of all rides they’re working on" do
    mechanic1 = Mechanic.create(
      name: "mechanic 1",
      experience: 10
    )
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
    mechanic1.rides << ride1
    mechanic1.rides << ride2
    mechanic1.rides << ride3

    visit "/mechanics/#{mechanic1.id}"

    within "section.mechanic-details" do
      expect(page).to have_content("Mechanic: #{mechanic1.name}")
      expect(page).to have_content("Years of Experience: #{mechanic1.experience}")
    end

    within "section.mechanic-rides" do
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to have_content(ride3.name)
    end
  end

  it "See a form to add an existing ride id to mechanics rides" do
    mechanic1 = Mechanic.create(
      name: "mechanic 1",
      experience: 10
    )
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
    mechanic1.rides << ride1
    mechanic1.rides << ride2

    visit "/mechanics/#{mechanic1.id}"

    within "section.mechanic-rides" do
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to_not have_content(ride3.name)
    end

    within "section.add-ride-form" do
      fill_in :ride_id, with: "#{ride3.id}"
      click_button "Assign Ride"
    end

    expect(current_path).to eq("/mechanics/#{mechanic1.id}")

    within "section.mechanic-rides" do
      expect(page).to have_content("Current rides they’re working on:")
      expect(page).to have_content(ride1.name)
      expect(page).to have_content(ride2.name)
      expect(page).to have_content(ride3.name)
    end
  end

end
