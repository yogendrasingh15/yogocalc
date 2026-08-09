class AccountTransactionsController < ApplicationController
  before_action :set_account

  def new
    @account_transaction = @account.account_transactions.new
  end

  def create
    @account_transaction = @account.account_transactions.new(account_transaction_params)

    if @account_transaction.save
      redirect_to account_path(@account), notice: "Transaction was successfully recorded."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def account_transaction_params
    params.require(:account_transaction).permit(:transaction_type, :amount, :description, :reference_number, :transaction_date)
  end
end
