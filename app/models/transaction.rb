class Transaction < ApplicationRecord
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, presence: true # TODO: Consider format validation
  validates :payment_method_token, presence: true
  validates :ticket_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :flight
  belongs_to :saved_card, optional: true
end
