class AssetsController < InheritedResources::Base
  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      redirect_to @asset, notice: 'Asset was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def asset_params
      params.require(:asset).permit(:title, :description, :file)
    end

end
