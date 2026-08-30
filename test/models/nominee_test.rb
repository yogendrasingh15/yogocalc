require "test_helper"

class NomineeTest < ActiveSupport::TestCase
  test "nominee_for options include key finance institutions" do
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "banks"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "insurance"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "ppf"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "investments"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "provident_fund_retirement"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "post_office"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "demat_accounts"
    assert_includes Nominee::NOMINEE_FOR_OPTIONS, "property_assets"
  end

  test "belongs to a user" do
    user = User.new(email: "test@example.com", password: "password123")
    nominee = Nominee.new(user: user, name: "Test Nominee", nominee_for: "banks")

    assert_equal user, nominee.user
  end
end
