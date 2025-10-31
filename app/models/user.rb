class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :profile, dependent: :destroy

  # Create a profile automatically after a user is created.
  after_create :create_profile_from_user

  private

  def create_profile_from_user
    return if profile.present?

    # If a profile with the same email already exists, link it to this user.
    prof = Profile.find_or_initialize_by(email: email)
    prof.name ||= name
    prof.address ||= address.presence
    prof.mobile ||= (mobile.present? ? mobile.to_s : nil)
    prof.gender ||= gender.presence
    prof.user = self
    prof.save(validate: true)
  end
end
