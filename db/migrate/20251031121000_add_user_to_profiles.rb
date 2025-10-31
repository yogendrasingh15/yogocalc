class AddUserToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :user, foreign_key: true, index: true
  end
end
