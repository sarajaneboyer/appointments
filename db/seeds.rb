# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = ['physician', 'person']
10.times do
  doctor = Doctor.create(
    name: Faker::Name.name
  )
    10.times do
      patient = Patient.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
      )

      Appt.create(
        role: roles.sample,
        doctor_id: doctor.id,
        patient_id: patient.id
      )
    end
end