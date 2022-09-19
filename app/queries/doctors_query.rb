# frozen_string_literal: true

class DoctorsQuery
  def call(doctors, params)
    filter_by_specialty(doctors, params[:specialty])
  end

  private

  def filter_by_specialty(scoped, specialty)
    specialty ? scoped.where(specialty_id: specialty) : scoped
  end
end
