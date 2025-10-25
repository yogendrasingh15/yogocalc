class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.text :description
      t.boolean :active, default: true, null: false

      t.timestamps
    end
    add_index :sellers, :email, unique: true
  end
end
