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
end
