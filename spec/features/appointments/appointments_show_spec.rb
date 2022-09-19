# frozen_string_literal: true

RSpec.describe AppointmentsShow do
  subject(:appointments_show) { described_class.new }

  let!(:doctor) { create :doctor }
  let!(:appointment) { create :appointment, doctor: doctor }

  before do
    login_as(doctor, scope: :doctor)
    appointments_show.load id: appointment.id
  end

  describe "content" do
    it { expect(appointments_show).to be_all_there }

    it { expect(appointments_show.appointment_date.text).to eq(appointment.decorate.duration_datetime) }
    it { expect(appointments_show.appointment_doctor.text).to eq(appointment.doctor.full_name) }
    it { expect(appointments_show.appointment_specialty.text).to eq(appointment.doctor.specialty&.name) }
    it { expect(appointments_show.appointment_patient.text).to eq(appointment.full_name) }
    it { expect(appointments_show.appointment_user_tel.text).to eq(appointment.user.phone_number) }
    it { expect(appointments_show.appointment_symptoms.text).to eq(appointment.symptoms) }

    it { expect(appointments_show).to have_textarea_recommendation_body }
    it { expect(appointments_show).to have_submit_btn }
  end

  describe "a specification" do
    it "when create recommendation" do
      appointments_show.recommendation_fill_and_send(FFaker::Book.description)
      expect(appointments_show).to have_success_alert

      expect(appointments_show).to have_recommendation_body
      expect(appointments_show).to have_recommendation_date
    end
  end
end
