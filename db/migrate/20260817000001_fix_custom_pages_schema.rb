class FixCustomPagesSchema < ActiveRecord::Migration[7.0]
  def up
    drop_table :custom_pages, if_exists: true

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
      t.integer :parent_id
      t.integer :sort_order, default: 0, null: false
      t.string :featured_image
      t.string :meta_title
      t.text :meta_description
      t.text :meta_keywords
      t.string :canonical_url
      t.string :robots
      t.datetime :published_at
      t.datetime :scheduled_at
      t.bigint :created_by, null: false
      t.bigint :updated_by
      t.datetime :deleted_at
      t.timestamps null: false
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

  def down
    drop_table :custom_pages, if_exists: true

    create_table :custom_pages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :slug, null: false
      t.boolean :published, default: false, null: false
      t.integer :position, default: 0, null: false
      t.string :meta_title
      t.string :excerpt
      t.string :page_type
      t.boolean :status
      t.boolean :is_homepage, default: false, null: false
      t.string :meta_description
      t.string :meta_keywords
      t.string :meta_robots
      t.string :meta_author
      t.string :meta_canonical_url
      t.string :meta_viewport
      t.string :meta_language
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
