# frozen_string_literal: true

require "reform/form/dry"

class FormWithDryValidations < Reform::Form
  feature Reform::Form::Dry
end
