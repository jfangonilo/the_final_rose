require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :season_number }
    it { should validate_numericality_of(:season_number).is_greater_than(0) }
    it { should validate_presence_of :season_description }
  end

  describe 'relationships' do
    it { should have_many :contestants }
  end

  describe 'instance methods' do
    before :each do
      @bachelorette_1 = Bachelorette.create!(name: "Amy", season_number: 1, season_description: "Crazy season!")

      @contestant_1 = Contestant.create!(name: "Andy", age: 21, hometown: "Ann Arbor", bachelorette: @bachelorette_1)
      @contestant_2 = Contestant.create!(name: "Ben", age: 23, hometown: "Baltimore", bachelorette: @bachelorette_1)
      @contestant_3 = Contestant.create!(name: "Chris", age: 26, hometown: "Cleveland", bachelorette: @bachelorette_1)
      @contestant_4 = Contestant.create!(name: "Connor", age: 24, hometown: "Cleveland", bachelorette: @bachelorette_1)
    end

    it 'avg_contestant_age' do
      expect(@bachelorette_1.avg_contestant_age).to be_between(23, 24)
    end

    it 'contestant_hometowns' do
      expect(@bachelorette_1.contestant_hometowns).to match_array ["Ann Arbor", "Baltimore", "Cleveland"]
    end

  end
end
