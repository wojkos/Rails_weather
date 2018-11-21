class City < ApplicationRecord
  validates :name, presence: true
  validates :views, presence: true, numericality: {greater_than: 0}

  scope :most_checked, -> { order('views DESC').limit(10) }
end
