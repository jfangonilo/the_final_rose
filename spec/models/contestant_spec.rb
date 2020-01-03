require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_numericality_of(:age).is_greater_than(0) }
    it { should validate_presence_of :hometown }
  end

  describe 'relationships' do
    it { should belong_to :bachelorette }
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end
end
