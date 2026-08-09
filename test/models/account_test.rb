require "test_helper"

class AccountTest < ActiveSupport::TestCase
  test "account requires a customer and valid account details" do
    customer = Customer.create!(
      customer_number: "CUST-2001",
      customer_type: "individual",
      first_name: "Alex",
      last_name: "Morgan",
      status: "active",
      customer_since: Date.current
    )

    account = Account.new(customer: customer, account_number: "ACC-2001", account_type: "savings")
    assert account.valid?

    invalid = Account.new(customer: nil, account_number: "", account_type: "")
    assert_not invalid.valid?
    assert_includes invalid.errors[:customer], "must exist"
    assert_includes invalid.errors[:account_number], "can't be blank"
    assert_includes invalid.errors[:account_type], "can't be blank"
  end

  test "account number must be unique" do
    customer = Customer.create!(
      customer_number: "CUST-2002",
      customer_type: "business",
      business_name: "Northwind",
      status: "active",
      customer_since: Date.current
    )

    Account.create!(customer: customer, account_number: "ACC-2002", account_type: "checking")

    duplicate = Account.new(customer: customer, account_number: "ACC-2002", account_type: "checking")
    assert_not duplicate.valid?
    assert_includes duplicate.errors[:account_number], "has already been taken"
  end
end
