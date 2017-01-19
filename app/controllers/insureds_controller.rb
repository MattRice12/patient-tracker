class InsuredsController < ApplicationController
  def index
    @insured = Insured.find_by(day_id: params.fetch(:id))
    render json: @insured
  end

  def create
    @insured = Insured.new(day_id: params[:day_id])
    if @insured.save
      render json: @insured
    end
  end

  def destroy
    insured = Insured.find(params[:id])
    if insured.destroy
      render json: { message: "Deleted" }
    else
      redirect_to :back
    end
  end
end
