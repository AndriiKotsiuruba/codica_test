# frozen_string_literal: true

RSpec.describe Recommendation do
  let!(:doctor) { create :doctor }
  let!(:appointment) { create :appointment }
  let(:recommendation_params) do
    result = attributes_for(:recommendation, appointment: appointment)
    result[:appointment_id] = appointment.id
    result
  end

  describe "#create" do
    before do
      sign_in doctor
      post "/recommendations", params: { recommendation: recommendation_params }
    end

    context "when correct params" do
      it { expect(response).to redirect_to(assigns(:appointment)) }
    end

    context "when invalid params" do
      let(:recommendation_params) { { appointment_id: appointment.id } }

      it { expect(response).to redirect_to(assigns(:appointment)) }
    end
  end
end
