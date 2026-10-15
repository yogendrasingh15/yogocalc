class ServiceRequestsController < ApplicationController
  PAGE_SIZE = 10

  before_action :set_service_request, only: %i[show edit update destroy]

  def index
    requests = ServiceRequest.left_joins(:customer)
    requests = requests.where(
      "service_requests.request_number LIKE :query OR service_requests.title LIKE :query " \
      "OR service_requests.description LIKE :query OR service_requests.category LIKE :query " \
      "OR customers.first_name LIKE :query OR customers.last_name LIKE :query " \
      "OR customers.business_name LIKE :query",
      query: "%#{params[:q]}%"
    ) if params[:q].present?
    requests = requests.where(status: params[:status]) if ServiceRequest::STATUSES.include?(params[:status])
    requests = requests.where(priority: params[:priority]) if ServiceRequest::PRIORITIES.include?(params[:priority])
    requests = requests.where(reported_channel: params[:reported_channel]) if ServiceRequest::REPORTED_CHANNELS.include?(params[:reported_channel])

    @total_count = requests.distinct.count(:id)
    @total_pages = [(@total_count.to_f / PAGE_SIZE).ceil, 1].max
    @page = [[params[:page].to_i, 1].max, @total_pages].min
    @service_requests = requests.distinct.includes(:customer)
                                .order(reported_at: :desc, id: :desc)
                                .limit(PAGE_SIZE)
                                .offset((@page - 1) * PAGE_SIZE)
    @status_counts = ServiceRequest.group(:status).count
  end

  def show; end

  def new
    @service_request = ServiceRequest.new
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)

    if @service_request.save
      respond_to do |format|
        format.html { redirect_to @service_request, notice: "Service request was successfully created." }
        format.json { render :show, status: :created, location: @service_request }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @service_request.update(service_request_params)
      respond_to do |format|
        format.html { redirect_to @service_request, notice: "Service request was successfully updated." }
        format.json { render :show, status: :ok, location: @service_request }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service_request.destroy

    respond_to do |format|
      format.html { redirect_to service_requests_url, notice: "Service request was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def service_request_params
    params.require(:service_request).permit(
      :tenant_id, :customer_id, :solar_site_id, :solar_system_id, :solar_component_id,
      :request_type, :category, :subcategory, :title, :description,
      :reported_by, :reported_channel, :priority, :severity, :status,
      :acknowledged_at, :resolved_at, :closed_at, :customer_visible,
      :preferred_visit_date, :preferred_visit_time, :attachments_count
    )
  end
end
