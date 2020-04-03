require "rails_helper"

RSpec.describe "when a user visits the mechanics index page: " do
  it "See a header saying 'All Mechanics'" do
    visit "/mechanics"

    within "heading.index-heading" do
      expect(page).to have_content("All Mechanics")
    end
  end
  it "See a list of all mechanic’s names and their years of experience" do
    mechanic1 = Mechanic.create(
      name: "mechanic 1",
      experience: 10
    )
    mechanic2 = Mechanic.create(
      name: "mechanic 2",
      experience: 20
    )
    visit "/mechanics"

    within "section.mechanics-list" do
      expect(page).to have_content("#{mechanic1.name} - #{mechanic1.experience} years of experience")
      expect(page).to have_content("#{mechanic2.name} - #{mechanic2.experience} years of experience")
    end
  end

end
