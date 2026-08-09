require "test_helper"

class AccountTransactionTest < ActiveSupport::TestCase
  test "a deposit updates the account balance" do
    customer = Customer.create!(
      customer_number: "CUST-3001",
      customer_type: "individual",
      first_name: "Morgan",
      last_name: "Lee",
      status: "active",
      customer_since: Date.current
    )

    account = Account.create!(
      customer: customer,
      account_number: "ACC-3001",
      account_type: "savings",
      balance: 100.0,
      available_balance: 100.0
    )

    transaction = AccountTransaction.create!(
      account: account,
      transaction_type: "deposit",
      amount: 25.5,
      description: "Initial deposit",
      reference_number: "TXN-001"
    )

    account.reload
    assert_equal 125.5, account.balance
    assert_equal 125.5, account.available_balance
    assert_equal transaction, account.account_transactions.last
  end

  test "a withdrawal reduces the account balance" do
    customer = Customer.create!(
      customer_number: "CUST-3002",
      customer_type: "business",
      business_name: "Blue Peak",
      status: "active",
      customer_since: Date.current
    )

    account = Account.create!(
      customer: customer,
      account_number: "ACC-3002",
      account_type: "checking",
      balance: 80.0,
      available_balance: 80.0
    )

    transaction = AccountTransaction.new(
      account: account,
      transaction_type: "withdrawal",
      amount: 10.0,
      description: "ATM withdrawal"
    )

    assert transaction.valid?
    transaction.save!

    account.reload
    assert_equal 70.0, account.balance
    assert_equal 70.0, account.available_balance
  end
end
