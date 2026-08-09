class CreateAccountTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :account_transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.string :transaction_type, null: false
      t.decimal :amount, precision: 19, scale: 4, null: false
      t.string :description, null: false
      t.datetime :transaction_date, default: -> { "CURRENT_TIMESTAMP" }
      t.decimal :balance_after, precision: 19, scale: 4
      t.string :reference_number

      t.timestamps
    end
  end
end
