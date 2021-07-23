require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'class methods' do
    before(:each) do
      @mission1 = Mission.create!(title: 'Apollo 13', time_in_space: 42)
      @mission2 = Mission.create!(title: 'Capricorn 4', time_in_space: 64)
      @mission3 = Mission.create!(title: 'Gemini 7', time_in_space: 79)
      @mission4 = Mission.create!(title: 'Zeus 10', time_in_space: 98)
      @mission5 = Mission.create!(title: 'Pluto 1', time_in_space: 104)
    end

    describe '::alphabatize' do
      it 'sorts the missions by name' do
        expected = [@mission1, @mission2, @mission3, @mission5, @mission4]
        expect(Mission.alphabatize).to eq(expected)
      end
    end
  end
end
