require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    before(:each) do
      @astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 45, job: 'Commander')
      @astronaut2 = Astronaut.create!(name: 'Buzz Aldrin', age: 40, job: 'Commander')
      @astronaut3 = Astronaut.create!(name: 'Chris Cassidy', age: 38, job: 'Commander')
    end
    describe '::average_age' do
      it 'calculates the average age of all astronauts' do
        expect(Astronaut.average_age).to eq(41)
      end
    end
  end
end
