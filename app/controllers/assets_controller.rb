class AssetsController < InheritedResources::Base
  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      attach_file if params.dig(:asset, :file).present?
      redirect_to @asset, notice: 'Asset was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @asset = resource

    if @asset.update(asset_params)
      attach_file if params.dig(:asset, :file).present?
      redirect_to @asset, notice: 'Asset was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def asset_params
      params.require(:asset).permit(:title, :description, :asset_type, :file)
    end

    def attach_file
      @asset.file.attach(params[:asset][:file]) if @asset.respond_to?(:file)
    end

end
