class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update destroy]

  def index
    @pages = Page.ordered
  end

  def show; end

  def new
    @page = Page.new(status: "draft", is_homepage: false)
  end

  def edit; end

  def create
    @page = Page.new(page_params)

    if @page.save
      redirect_to @page, notice: "Page was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: "Page was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: "Page was successfully destroyed."
  end

  private

  def set_page
    @page = Page.find_by(slug: params[:id]) || Page.find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound if @page.nil?
  end

  def page_params
    params.require(:page).permit(
      :site_id, :parent_id, :title, :slug, :path, :status, :template_id,
      :content, :is_homepage, :published_at
    )
  end
end
