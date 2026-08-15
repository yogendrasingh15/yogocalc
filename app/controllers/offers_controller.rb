class OffersController < ApplicationController
  before_action :set_offer, only: %i[show edit update destroy]

  def index
    @offers = Offer.order(is_featured: :desc, created_at: :desc)
  end

  def show; end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer, notice: "Offer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @offer.update(offer_params)
      redirect_to @offer, notice: "Offer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url, notice: "Offer was successfully destroyed."
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :offer_type, :destination, :description, :price, :original_price, :discount_percentage, :start_date, :end_date, :status, :is_featured, :image_url)
  end
end
