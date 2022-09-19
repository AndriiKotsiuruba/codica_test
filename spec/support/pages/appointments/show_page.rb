# frozen_string_literal: true

class AppointmentsShow < SitePrism::Page
  set_url "/appointments/{id}"

  section :header, Header
  section :footer, Footer

  element :title, "h1.general-title-margin"

  element :appointment_date, ".date"
  element :appointment_doctor, ".doctor"
  element :appointment_specialty, ".specialty"
  element :appointment_patient, ".patient"
  element :appointment_user_tel, ".user_tel"
  element :appointment_symptoms, ".symptoms"

  element :recommendation_body, ".recommendation_body"
  element :recommendation_date, ".recommendation_date"

  element :textarea_recommendation_body, "textarea[name='recommendation[body]']"
  element :submit_btn, "input[name='commit'].btn.btn-outline-primary"

  element :errors_alert, ".alert-danger"
  element :success_alert, ".alert-success"

  expected_elements :header, :footer,
                    :title, :appointment_date, :appointment_doctor, :appointment_specialty,
                    :appointment_patient, :appointment_user_tel, :appointment_symptoms

  def recommendation_fill_and_send(body)
    textarea_recommendation_body.set body
    submit_btn.click
  end
end
