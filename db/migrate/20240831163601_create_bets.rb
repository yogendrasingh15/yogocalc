class CreateBets < ActiveRecord::Migration[7.0]
  def change
    create_table :bets do |t|
      t.float :amount
      t.integer :match_id
      t.boolean :yes_not
      t.float :bet_reading
      t.integer :score
      t.integer :wicket
      t.references :user
      t.timestamps
    end
  end
end
