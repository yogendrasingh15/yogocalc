class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_number, null: false
      t.string :customer_type, null: false
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :business_name
      t.date :date_of_birth
      t.string :gender
      t.string :nationality
      t.string :status, null: false, default: "active"
      t.date :customer_since, null: false
      t.integer :branch_id

      t.timestamps
    end

    add_index :customers, :customer_number, unique: true
  end
end
