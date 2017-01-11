class PatientsController < ApplicationController
  def create
    Patient.create!(day_id: params[:day_id], insured: params[:insured])
    redirect_to :back
  end

  def destroy
    patient = Patient.find(params[:id])
    if patient.destroy
      redirect_to :back
    else
      flash[:alert] = "Failed to Delete Patient"
      redirect_to :back
    end
  end
end
