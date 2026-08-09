class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :account_number, null: false
      t.string :account_type, null: false
      t.string :account_status, null: false, default: "ACTIVE"
      t.string :currency_code, null: false, default: "USD"
      t.decimal :balance, precision: 19, scale: 4, null: false, default: 0.0
      t.decimal :available_balance, precision: 19, scale: 4, null: false, default: 0.0
      t.decimal :interest_rate, precision: 7, scale: 4, default: 0.0
      t.decimal :overdraft_limit, precision: 19, scale: 4, null: false, default: 0.0
      t.datetime :opened_at, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :closed_at
      t.integer :branch_id
      t.boolean :is_joint_account, null: false, default: false
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end

    add_index :accounts, :account_number, unique: true
  end
end
