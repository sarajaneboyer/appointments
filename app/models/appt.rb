class Appt < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  def new
    @patients = Patient.all - @doctor.patients
    @appt = @doctor.appts.new
  end
  
end
