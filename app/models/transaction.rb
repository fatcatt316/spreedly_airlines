class Transaction < ApplicationRecord
  belongs_to :flight

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, presence: true # TODO: Consider format validation
  validates :ticket_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # TODO: Not this. Set value outside this model
  def set_amount
    self.amount ||= flight&.cost.to_i * ticket_count.to_i
  end
end
