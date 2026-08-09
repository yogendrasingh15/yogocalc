class AccountTransaction < ApplicationRecord
  belongs_to :account

  validates :account, presence: true
  validates :transaction_type, presence: true, inclusion: { in: %w[deposit withdrawal transfer fee interest] }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true

  after_create :update_account_balance

  private

  def update_account_balance
    return unless account.present?

    sign = transaction_type == "withdrawal" ? -1 : 1
    new_balance = account.balance + (amount * sign)
    new_available_balance = account.available_balance + (amount * sign)

    account.update_columns(balance: new_balance, available_balance: new_available_balance)
  end
end
