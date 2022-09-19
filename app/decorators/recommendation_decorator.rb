# frozen_string_literal: true

class RecommendationDecorator < Draper::Decorator
  delegate_all

  def date
    l created_at
  end
end
