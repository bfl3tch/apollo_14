class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.alphabatize
    order(:title)
  end

end
