class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.text :address
      t.string :mobile
      t.string :pincode
      t.string :gender

      t.timestamps
    end

    add_index :profiles, :email, unique: true
  end
end
