class SavedCard < ApplicationRecord
  validates :card_type, presence: true
  validates :last_four_digits, length: { is: 4 }
  validates :token, presence: true

  has_many :transactions

  def to_s
    [card_type, last_four_digits].join(' ')
  end
end
