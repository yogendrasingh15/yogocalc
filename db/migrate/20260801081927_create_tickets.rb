class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.integer :project_id, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false, default: "open"
      t.integer :priority, null: false, default: 0
      t.string :category
      t.string :assigned_to
      t.datetime :due_date
      t.string :ticket_number, null: false, unique: true
      t.string :location
      t.integer :closed_by
      t.integer :closed_at
      t.timestamps
    end
  end
end
