class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index
    @accounts = Account.includes(:customer)
    @accounts = @accounts.where("account_number LIKE :q OR account_type LIKE :q", q: "%#{params[:q]}%") if params[:q].present?
    @accounts = @accounts.where(account_status: params[:account_status]) if params[:account_status].present?
    @accounts = @accounts.order(created_at: :desc)
  end

  def show; end

  def new
    @account = Account.new
    @customers = Customer.order(:first_name, :last_name, :business_name)
  end

  def create
    @account = Account.new(account_params)
    @customers = Customer.order(:first_name, :last_name, :business_name)

    if @account.save
      redirect_to @account, notice: "Account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customers = Customer.order(:first_name, :last_name, :business_name)
  end

  def update
    @customers = Customer.order(:first_name, :last_name, :business_name)

    if @account.update(account_params)
      redirect_to @account, notice: "Account was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: "Account was successfully destroyed."
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(
      :customer_id, :account_number, :account_type, :account_status,
      :currency_code, :balance, :available_balance, :interest_rate,
      :overdraft_limit, :opened_at, :closed_at, :branch_id,
      :is_joint_account, :created_by, :updated_by
    )
  end
end
