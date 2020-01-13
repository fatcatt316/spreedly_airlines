class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :flight
      t.integer :ticket_count
      t.string :email
      t.integer :amount
      t.string :payment_method_token
      t.string :transaction_token

      t.timestamps
    end
  end
end
