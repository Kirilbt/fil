class ServicesController < ApplicationController
  before_action :set_service, only: [:show]
  skip_before_action :authenticate_user!, only: [:urgent, :show]

  def urgent
    @urgents = Service.select { |service| service.urgent == true }
  end

  def show
    @markers = {
      lat: @service.latitude,
      lng: @service.longitude,
      info_window: render_to_string(partial: "shared/info_window", locals: { service: @service })
    }
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end
end
