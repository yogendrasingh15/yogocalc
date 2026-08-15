class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :offer_type
      t.string :destination
      t.text :description
      t.decimal :price
      t.decimal :original_price
      t.decimal :discount_percentage
      t.date :start_date
      t.date :end_date
      t.string :status
      t.boolean :is_featured
      t.string :image_url

      t.timestamps
    end
  end
end
