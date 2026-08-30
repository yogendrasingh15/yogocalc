class AddUserAndNomineeForToNominees < ActiveRecord::Migration[7.0]
  def change
    add_reference :nominees, :user, foreign_key: true, index: true
    add_column :nominees, :nominee_for, :string
  end
end
