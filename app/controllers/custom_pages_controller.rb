class CustomPagesController < ApplicationController
  before_action :set_custom_page, only: %i[show edit update destroy]

  def index
    @custom_pages = CustomPage.ordered
  end

  def show; end

  def new
    @custom_page = CustomPage.new(
      page_type: "standard",
      status: "draft",
      is_active: true,
      is_homepage: false,
      sort_order: 0
    )
  end

  def edit; end

  def create
    @custom_page = CustomPage.new(custom_page_params)
    @custom_page.created_by = current_user&.id
    @custom_page.updated_by = current_user&.id

    if @custom_page.save
      redirect_to @custom_page, notice: "Custom page was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @custom_page.updated_by = current_user&.id

    if @custom_page.update(custom_page_params)
      redirect_to @custom_page, notice: "Custom page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @custom_page.destroy
    redirect_to custom_pages_url, notice: "Custom page was successfully destroyed."
  end

  private

  def set_custom_page
    @custom_page = CustomPage.find_by(slug: params[:id]) || CustomPage.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound if @custom_page.nil?
  end

  def custom_page_params
    params.require(:custom_page).permit(
      :title, :slug, :content, :excerpt, :page_type, :template, :status,
      :is_active, :is_homepage, :parent_id, :sort_order, :featured_image,
      :meta_title, :meta_description, :meta_keywords, :canonical_url,
      :robots, :published_at, :scheduled_at
    )
  end
end
