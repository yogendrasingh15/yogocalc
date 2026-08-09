class Account < ApplicationRecord
  belongs_to :customer
  has_many :account_transactions, dependent: :destroy

  validates :customer, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :account_type, presence: true
  validates :account_status, presence: true
  validates :currency_code, presence: true, length: { is: 3 }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :available_balance, numericality: { greater_than_or_equal_to: 0 }
  validates :overdraft_limit, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_defaults

  private

  def set_defaults
    self.account_status = "ACTIVE" if account_status.blank?
    self.currency_code = "USD" if currency_code.blank?
    self.balance = 0 if balance.blank?
    self.available_balance = balance if available_balance.blank?
    self.overdraft_limit = 0 if overdraft_limit.blank?
    self.is_joint_account = false if is_joint_account.nil?
  end
end
