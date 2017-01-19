class UninsuredsController < ApplicationController
  def index
    @uninsured = Uninsured.find_by(day_id: params.fetch(:id))
    render json: @uninsured
  end

  def create
    @uninsured = Uninsured.new(day_id: params[:day_id])
    if @uninsured.save
      render json: @uninsured
    end
  end

  def destroy
    uninsured = Uninsured.find(params[:id])
    if uninsured.destroy
      render json: { message: "Deleted" }
    else
      redirect_to :back
    end
  end
end
