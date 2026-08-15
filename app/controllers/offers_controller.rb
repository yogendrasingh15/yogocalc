class OffersController < InheritedResources::Base
  def index
    @offers = Offer.order(is_featured: :desc, created_at: :desc)
  end

  private

    def offer_params
      params.require(:offer).permit(:title, :offer_type, :destination, :description, :price, :original_price, :discount_percentage, :start_date, :end_date, :status, :is_featured, :image_url)
    end

end
