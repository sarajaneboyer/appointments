class ApptsController < ApplicationController
  before_action :set_doctor
  def index
    @physicians = @doctor.appts.where(role: 'physician')
    @persons = @person.appts.where(role: 'person')
  end

  def new
    @appt = @doctor.appts.new
  end

  def create
    @appt = @doctor.appt.new(appt_params)

    if @appt.save
      redirect_to doctor_appts_path(@doctor)
    else
      render: new
    end
    
  end

  private

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def appt_params
      params.require(:appt).permit(:role, :patient_id)
    end

end
