class RequestsController < ApplicationController

  def index
    @requests = Request.where(user_id: current_user)
  end

  def new
    @sleep = Sleep.find(params[:sleep_id])
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @sleep = Sleep.find(params[:sleep_id])
    @request.service = @sleep
    @request.user = current_user
    @request.status_translations = "Pending"
    if @request.save
      redirect_to sleeps_path # TO CHANGE
    else
      render 'requests/new'
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_date, :end_date, :sleep_id)
  end
end
