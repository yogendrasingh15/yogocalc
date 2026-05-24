class CreateNominees < ActiveRecord::Migration[7.0]
  def change
    create_table :nominees do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :image_url
      t.string :aadhar_number
      t.string :pan_number
      t.string :mobile_number
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :pincode

      t.timestamps
    end
  end
end
