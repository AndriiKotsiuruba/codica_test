# frozen_string_literal: true

FactoryBot.create(:admin_user, phone_number: '+380667084037', password: 'password')
FactoryBot.create(:user, phone_number: '+380667084037', password: 'password')
FactoryBot.create(:doctor, phone_number: '+380667084037', password: 'password')

FactoryBot.create_list(:specialty, 5)
FactoryBot.create_list(:user, 9)
FactoryBot.create_list(:doctor, 19, specialty: Specialty.find(Specialty.pluck(:id).sample))
FactoryBot.create_list(:appointment, 100, user: User.find(User.pluck(:id).sample), doctor:  Doctor.find(Doctor.pluck(:id).sample))
FactoryBot.create_list(:recommendation, 30, appointment: Appointment.find(Appointment.pluck(:id).sample))
