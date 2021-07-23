require 'rails_helper'

RSpec.describe 'The astronaut index page' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 45, job: 'Commander')
    @astronaut2 = Astronaut.create!(name: 'Buzz Aldrin', age: 40, job: 'Commander')
    @astronaut3 = Astronaut.create!(name: 'Chris Cassidy', age: 38, job: 'Commander')

    visit '/astronauts'
  end

  it 'lists the astronauts and their attributes' do
    expect(page).to have_content(@astronaut1.name)
    expect(page).to have_content(@astronaut1.age)
    expect(page).to have_content(@astronaut1.job)
    expect(page).to have_content(@astronaut2.name)
    expect(page).to have_content(@astronaut2.age)
    expect(page).to have_content(@astronaut2.job)
    expect(page).to have_content(@astronaut3.name)
    expect(page).to have_content(@astronaut3.age)
    expect(page).to have_content(@astronaut3.job)
  end
end
