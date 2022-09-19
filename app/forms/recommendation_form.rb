# frozen_string_literal: true

class RecommendationForm < FormWithDryValidations
  property :body
  property :appointment

  validation do
    params do
      required(:body).filled(:string)
      required(:appointment).filled
    end
  end
end
