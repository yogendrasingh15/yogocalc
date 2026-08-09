require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "individual customers require first and last name" do
    customer = Customer.new(
      customer_number: "CUST-1001",
      customer_type: "individual",
      status: "active",
      customer_since: Date.current
    )

    assert_not customer.valid?
    assert_includes customer.errors[:first_name], "can't be blank"
    assert_includes customer.errors[:last_name], "can't be blank"
  end

  test "business customers require business name" do
    customer = Customer.new(
      customer_number: "CUST-1002",
      customer_type: "business",
      status: "active",
      customer_since: Date.current
    )

    assert_not customer.valid?
    assert_includes customer.errors[:business_name], "can't be blank"
  end

  test "customer number must be unique" do
    Customer.create!(
      customer_number: "CUST-1003",
      customer_type: "individual",
      first_name: "Jane",
      last_name: "Doe",
      status: "active",
      customer_since: Date.current
    )

    duplicate = Customer.new(
      customer_number: "CUST-1003",
      customer_type: "individual",
      first_name: "John",
      last_name: "Smith",
      status: "active",
      customer_since: Date.current
    )

    assert_not duplicate.valid?
    assert_includes duplicate.errors[:customer_number], "has already been taken"
  end
end
