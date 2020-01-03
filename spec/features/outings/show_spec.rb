require 'rails_helper'

RSpec.describe "As a visitor," do
  describe "the outings show page" do

    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Amy", season_number: 1, season_description: "Crazy season!")
      @bachelorette_2 = Bachelorette.create!(name: "Beth", season_number: 2, season_description: "Crazier season!")

      @contestant_1 = Contestant.create!(name: "Andy", age: 21, hometown: "Ann Arbor", bachelorette: @bachelorette_1)
      @contestant_2 = Contestant.create!(name: "Ben", age: 23, hometown: "Baltimore", bachelorette: @bachelorette_1)
      @contestant_3 = Contestant.create!(name: "Chris", age: 26, hometown: "Cleveland", bachelorette: @bachelorette_1)
      @contestant_4 = Contestant.create!(name: "Dave", age: 30, hometown: "Detroit", bachelorette: @bachelorette_2)

      @outing_1 = Outing.create!(name: "Air Hockey", location: "Alaska", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_1, outing: @outing_1)
      ContestantOuting.create!(contestant: @contestant_2, outing: @outing_1)

      @outing_2 = Outing.create!(name: "Basketball", location: "Bora Bora", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_1, outing: @outing_2)
      ContestantOuting.create!(contestant: @contestant_2, outing: @outing_2)
      ContestantOuting.create!(contestant: @contestant_3, outing: @outing_2)
      ContestantOuting.create!(contestant: @contestant_4, outing: @outing_2)

      @outing_3 = Outing.create!(name: "Croquet", location: "Cancun", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_2, outing: @outing_3)
      ContestantOuting.create!(contestant: @contestant_3, outing: @outing_3)
      ContestantOuting.create!(contestant: @contestant_4, outing: @outing_3)
    end

    it 'shows the outings info, count of contestants and their names' do
      visit "/outings/#{@outing_3.id}"

      within "#outing-info" do
        expect(page).to have_content @outing_3.name
        expect(page).to have_content @outing_3.location
        expect(page).to have_content @outing_3.date
        expect(page).to have_content @outing_3.contestants.length
      end

      within "#contestants" do
        expect(page).not_to have_content @contestant_1.name
        expect(page).to have_content @contestant_2.name
        expect(page).to have_content @contestant_3.name
        expect(page).to have_content @contestant_4.name
      end
    end

  end
end
