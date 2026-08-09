class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
    @customers = @customers.where("first_name LIKE :q OR last_name LIKE :q OR business_name LIKE :q OR customer_number LIKE :q", q: "%#{params[:q]}%") if params[:q].present?
    @customers = @customers.where(status: params[:status]) if params[:status].present?
    @customers = @customers.order(created_at: :desc)
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: "Customer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "Customer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url, notice: "Customer was successfully destroyed."
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :customer_number, :customer_type, :first_name, :middle_name, :last_name,
      :business_name, :date_of_birth, :gender, :nationality, :status,
      :customer_since, :branch_id
    )
  end
end
