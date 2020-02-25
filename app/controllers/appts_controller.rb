class ApptsController < ApplicationController
  before_action :set_doctor
  def index
    @physicians = @doctor.appts.where(role: 'physician')
    @persons = @patient.appts.where(role: 'person')
  end

  def new
    @appt = @doctor.appts.new
  end

  def create
    @appt = @doctor.appt.new(appt_params)

    if @appt.save
      redirect_to doctor_appts_path(@doctor)
    else
      render :new
    end
  end

  def destroy
    @appt = @doctor.appt.find(params[:id])
    @appt.destroy
    redirect_to doctor_appts_path(@doctor)
  end

  private

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appt_params
      params.require(:appt).permit(:role, :patient_id, :doctor_id, :day)
    end

end
