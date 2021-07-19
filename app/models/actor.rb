class Actor < ApplicationRecord
  belongs_to :movie

  def self.sort_by_age
    all.order("age")
  end

  def self.average_age
    all.average("age").round(2)
  end
end
