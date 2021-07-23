require 'rails_helper'

RSpec.describe 'The astronaut index page' do
  before(:each) do
    @astronaut1 = Astronaut.create!(name: 'Neil Armstrong', age: 45, job: 'Commander')
    @astronaut2 = Astronaut.create!(name: 'Buzz Aldrin', age: 40, job: 'Commander')
    @astronaut3 = Astronaut.create!(name: 'Chris Cassidy', age: 38, job: 'Commander')

    @mission1 = Mission.create!(title: 'Apollo 13', time_in_space: 42)
    @mission2 = Mission.create!(title: 'Capricorn 4', time_in_space: 64)
    @mission3 = Mission.create!(title: 'Gemini 7', time_in_space: 79)
    @mission4 = Mission.create!(title: 'Zeus 10', time_in_space: 98)
    @mission5 = Mission.create!(title: 'Pluto 1', time_in_space: 104)

    @astromission1 = AstronautMission.create(astronaut: @astronaut1, mission: @mission1)
    @astromission2 = AstronautMission.create(astronaut: @astronaut1, mission: @mission2)
    @astromission3 = AstronautMission.create(astronaut: @astronaut1, mission: @mission3)
    @astromission4 = AstronautMission.create(astronaut: @astronaut2, mission: @mission4)
    @astromission5 = AstronautMission.create(astronaut: @astronaut2, mission: @mission5)
    @astromission6 = AstronautMission.create(astronaut: @astronaut3, mission: @mission1)
    @astromission7 = AstronautMission.create(astronaut: @astronaut3, mission: @mission2)
    @astromission8 = AstronautMission.create(astronaut: @astronaut3, mission: @mission3)

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

  it 'shows the average age of all the astronauts' do
    expect(page).to have_content("Average age for all astronauts: 41")
  end

  it 'lists the associated space missions in alphabetical order for each astronaut' do
    expect(@mission1.title).to appear_before(@mission2.title)
    expect(@mission2.title).to appear_before(@mission3.title)
  end
end
