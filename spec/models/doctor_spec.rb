# frozen_string_literal: true

RSpec.describe Doctor do
  describe "associations" do
    it { is_expected.to belong_to(:specialty).optional(true) }
    it { is_expected.to have_one(:picture).dependent(:destroy) }
    it { is_expected.to have_many(:appointments).dependent(:nullify) }
  end

  describe "validations" do
    subject { build(:doctor) }

    it { is_expected.to validate_uniqueness_of(:phone_number).case_insensitive }

    it { is_expected.not_to allow_value(FFaker::PhoneNumber.phone_calling_code).for(:phone_number) }
    it { is_expected.not_to allow_value(FFaker::PhoneNumber.short_phone_number).for(:phone_number) }
    it { is_expected.not_to allow_value(FFaker::NatoAlphabet.numeric_code).for(:phone_number) }
    it { is_expected.not_to allow_value("+#{FFaker::Random.rand((10**15)..((10**16) - 1))}").for(:phone_number) }
    it { is_expected.to allow_value("+#{FFaker::Random.rand((10**6)..((10**15) - 1))}").for(:phone_number) }
  end
end
