class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age).to_i
  end

  def total_spacetime
    missions.pluck(:time_in_space).sum
  end
end
