class CreateSavedCards < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_cards do |t|
      t.string :last_four_digits, limit: 4
      t.string :card_type
      t.string :token

      t.timestamps
    end
  end
end
