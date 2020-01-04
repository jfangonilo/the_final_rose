require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "the contestant index page" do

    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Amy", season_number: 1, season_description: "Crazy season!")
      @bachelorette_2 = Bachelorette.create!(name: "Beth", season_number: 2, season_description: "Crazier season!")

      @contestant_1 = Contestant.create!(name: "Andy", age: 21, hometown: "Ann Arbor", bachelorette: @bachelorette_1)
      @contestant_2 = Contestant.create!(name: "Ben", age: 23, hometown: "Baltimore", bachelorette: @bachelorette_1)
      @contestant_3 = Contestant.create!(name: "Chris", age: 26, hometown: "Cleveland", bachelorette: @bachelorette_1)
      @contestant_5 = Contestant.create!(name: "Connor", age: 26, hometown: "Cleveland", bachelorette: @bachelorette_1)
      @contestant_4 = Contestant.create!(name: "Dave", age: 30, hometown: "Detroit", bachelorette: @bachelorette_2)
    end

    it 'shows the bachelorettes contestants' do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"

      within "#contestants" do
        expect(page).to have_content @contestant_1.name
        expect(page).to have_content @contestant_2.name
        expect(page).to have_content @contestant_3.name
        expect(page).not_to have_content @contestant_4.name
      end
    end

    it 'shows each contestants info' do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"

      within "#contestant-#{@contestant_1.id}" do
        expect(page).to have_link @contestant_1.name
        expect(page).to have_content @contestant_1.age
        expect(page).to have_content @contestant_1.hometown
      end

      within "#contestant-#{@contestant_2.id}" do
        expect(page).to have_link @contestant_2.name
        expect(page).to have_content @contestant_2.age
        expect(page).to have_content @contestant_2.hometown
      end

      within "#contestant-#{@contestant_3.id}" do
        expect(page).to have_link @contestant_3.name
        expect(page).to have_content @contestant_3.age
        expect(page).to have_content @contestant_3.hometown
      end

      click_link @contestant_1.name
      expect(current_path).to eq("/contestants/#{@contestant_1.id}")
    end

    it 'lists the unique hometowns of each contestant' do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"

      within "#hometowns" do
        expect(page).to have_content("Ann Arbor", count: 1)
        expect(page).to have_content("Baltimore", count: 1)
        expect(page).to have_content("Cleveland", count: 1)
      end
    end

  end
end

