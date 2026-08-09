class HomeController < ApplicationController
  def index
    @customers_count = Customer.count
    @accounts_count = Account.count
    @active_customers_count = Customer.where(status: "active").count
    @active_accounts_count = Account.where(account_status: "ACTIVE").count
    @recent_customers = Customer.order(created_at: :desc).limit(5)
    @recent_accounts = Account.includes(:customer).order(created_at: :desc).limit(5)
  end
end
