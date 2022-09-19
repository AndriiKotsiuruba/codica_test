# frozen_string_literal: true

class ApplicationPresenter < SimpleDelegator
  def initialize(model, view)
    @model = model
    @view = view
    super(@model)
  end
end
