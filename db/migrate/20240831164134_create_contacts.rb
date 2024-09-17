class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :gender
      t.string :mobile
      t.string :email
      t.string :address
      t.string :dob
      t.references :role
      t.timestamps
    end
  end
end
