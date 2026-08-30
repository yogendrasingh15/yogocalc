class NomineesController < ApplicationController
  before_action :set_nominee, only: %i[show edit update destroy]

  def index
    @nominees = Nominee.order(created_at: :desc)
  end

  def show; end

  def new
    @nominee = current_user.nominees.build
  end

  def edit; end

  def create
    @nominee = current_user.nominees.build(nominee_params)

    if @nominee.save
      redirect_to @nominee, notice: 'Nominee was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @nominee.update(nominee_params)
      redirect_to @nominee, notice: 'Nominee was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @nominee.destroy
    redirect_to nominees_url, notice: 'Nominee was successfully deleted.'
  end

  private

    def set_nominee
      @nominee = current_user.nominees.find(params[:id])
    end

    def nominee_params
      params.require(:nominee).permit(
        :user_id,
        :nominee_for,
        :name,
        :category,
        :description,
        :image_url,
        :aadhar_number,
        :pan_number,
        :mobile_number,
        :email,
        :address,
        :city,
        :state,
        :pincode
      )
    end
end
