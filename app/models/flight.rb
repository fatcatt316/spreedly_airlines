class Flight < ApplicationRecord
  validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :destination, presence: true
  validates :origin, presence: true

  has_many :transactions
end
