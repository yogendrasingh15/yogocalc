class CreateServiceRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :service_requests do |t|
      t.integer :tenant_id
      t.references :customer, type: :integer, foreign_key: true
      t.integer :solar_site_id
      t.integer :solar_system_id
      t.integer :solar_component_id
      t.string :request_number, null: false
      t.string :request_type, null: false
      t.string :category
      t.string :subcategory
      t.string :title, null: false
      t.text :description
      t.string :reported_by
      t.string :reported_channel, null: false
      t.string :priority, null: false, default: "normal"
      t.string :severity, null: false, default: "medium"
      t.string :status, null: false, default: "open"
      t.datetime :reported_at, null: false, default: -> { "CURRENT_TIMESTAMP" }
      t.datetime :acknowledged_at
      t.datetime :resolved_at
      t.datetime :closed_at
      t.boolean :customer_visible, null: false, default: true
      t.date :preferred_visit_date
      t.time :preferred_visit_time
      t.integer :attachments_count, null: false, default: 0

      t.timestamps
    end

    add_index :service_requests, :request_number, unique: true
    add_index :service_requests, :tenant_id
    add_index :service_requests, :solar_site_id
    add_index :service_requests, :solar_system_id
    add_index :service_requests, :solar_component_id
    add_index :service_requests, :reported_channel
    add_index :service_requests, :priority
    add_index :service_requests, :status
    add_index :service_requests, [:tenant_id, :status]
    add_index :service_requests, [:tenant_id, :reported_at]
  end
end
