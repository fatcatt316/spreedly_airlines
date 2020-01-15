class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :flight
      t.belongs_to :saved_card

      t.integer :ticket_count
      t.string :email
      t.integer :amount
      t.string :payment_method_token
      t.string :transaction_token
      t.boolean :save_card, default: false, null: false
      t.boolean :purchase_via_pmd, default: false, null: false

      t.timestamps
    end
  end
end
