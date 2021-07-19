class Actor < ApplicationRecord
  belongs_to :movie

  def self.sort_by_age
    all.order("age")
  end
end
