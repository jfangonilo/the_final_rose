require 'rails_helper'

RSpec.describe "As a visitor," do
  describe "the contestant show page" do

    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Amy", season_number: 1, season_description: "Crazy season!")
      @contestant_1 = Contestant.create!(name: "Andy", age: 21, hometown: "Ann Arbor", bachelorette: @bachelorette_1)

      @outing_1 = Outing.create!(name: "Air Hockey", location: "Alaska", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_1, outing: @outing_1)
      @outing_2 = Outing.create!(name: "Basketball", location: "Bora Bora", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_1, outing: @outing_2)
      @outing_3 = Outing.create!(name: "Croquet", location: "Cancun", date: Time.now)
      ContestantOuting.create!(contestant: @contestant_1, outing: @outing_3)
    end

    it 'shows the contestants season and outings' do
      visit "/contestants/#{@contestant_1.id}"

      within "#contestant-info" do
        @contestant_1.name
        @bachelorette_1.season_number
        @bachelorette_1.season_description
      end

      within "#outings" do
        expect(page).to have_link @outing_1.name
        expect(page).to have_link @outing_2.name
        expect(page).to have_link @outing_3.name
      end

      click_link @outing_1.name
      expect(current_path).to eq("/outings/#{@outing_1.id}")
    end

  end
end
