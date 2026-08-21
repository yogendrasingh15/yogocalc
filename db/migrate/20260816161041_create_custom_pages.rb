class CreateCustomPages < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content, null: false
      t.text :excerpt
      t.string :page_type, null: false
      t.string :template
      t.string :status, null: false, default: "draft"
      t.boolean :is_active, null: false, default: true
      t.boolean :is_homepage, null: false, default: false
      t.bigint :parent_id
      t.integer :sort_order, default: 0, null: false
      t.string :featured_image
      t.string :meta_title
      t.text :meta_description
      t.text :meta_keywords
      t.string :canonical_url
      t.string :robots
      t.datetime :published_at
      t.datetime :scheduled_at
      t.bigint :created_by
      t.bigint :updated_by
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :custom_pages, :slug, unique: true
    add_index :custom_pages, :status
    add_index :custom_pages, :is_active
    add_index :custom_pages, :is_homepage
    add_index :custom_pages, :parent_id
    add_index :custom_pages, :sort_order
    add_index :custom_pages, :published_at
    add_index :custom_pages, :scheduled_at
    add_index :custom_pages, :created_by
  end
end
