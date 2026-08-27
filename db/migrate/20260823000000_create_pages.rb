class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.integer :site_id
      t.integer :parent_id
      t.string :title, null: false
      t.string :slug, null: false
      t.string :path
      t.string :status, null: false, default: "draft"
      t.integer :template_id
      t.text :content, null: false
      t.boolean :is_homepage, null: false, default: false
      t.datetime :published_at
      t.timestamps
    end

    add_index :pages, :site_id
    add_index :pages, :parent_id
    add_index :pages, :slug, unique: true
    add_index :pages, :status
    add_index :pages, :template_id
    add_index :pages, :is_homepage
    add_index :pages, :published_at
  end
end
