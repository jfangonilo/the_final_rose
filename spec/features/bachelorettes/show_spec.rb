require 'rails_helper'

RSpec.describe "bachelorette show page" do
  before :each do
    @bachelorette_1 = Bachelorette.create!(name: "Amy", season_number: 1, season_description: "Crazy season!")
    @bachelorette_2 = Bachelorette.create!(name: "Beth", season_number: 2, season_description: "Crazier season!")

    @contestant_1 = Contestant.create!(name: "Andy", age: 21, hometown: "Ann Arbor", bachelorette: @bachelorette_1)
    @contestant_2 = Contestant.create!(name: "Ben", age: 23, hometown: "Baltimore", bachelorette: @bachelorette_1)
    @contestant_3 = Contestant.create!(name: "Chris", age: 26, hometown: "Cleveland", bachelorette: @bachelorette_1)
    @contestant_4 = Contestant.create!(name: "Dave", age: 30, hometown: "Detroit", bachelorette: @bachelorette_2)
  end

  it 'shows the bachelorettes info' do
    visit "/bachelorettes/#{@bachelorette_1.id}"

    within "#bachelorette-info" do
      expect(page).to have_content @bachelorette_1.name
      expect(page).to have_content @bachelorette_1.season_number
      expect(page).to have_content @bachelorette_1.season_description
      click_link "Contestants"
    end

    expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")

    within "#contestants" do
      expect(page).to have_content @contestant_1.name
      expect(page).to have_content @contestant_2.name
      expect(page).to have_content @contestant_3.name
      expect(page).not_to have_content @contestant_4.name
    end
  end
end
