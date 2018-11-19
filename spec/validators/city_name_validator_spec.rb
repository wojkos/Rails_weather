require 'rails_helper'

describe CityNameValidator do
  context 'format' do
    it 'strings should be valid' do
      valid_strings =
        %w[Warszawa madrit duck Poznań New-town Secret New\ York Jon's Town]
      valid_strings.each do |str|
        validator = CityNameValidator::Schema.call(city: str)
        expect(validator.success?).to eq(true)
      end
    end

    it 'not valid input' do
      not_valid_input = [1, 'sdadsada32', 'New Town2']
      not_valid_input.each do |str|
        validator = CityNameValidator::Schema.call(city: str)
        expect(validator.success?).to eq(false)
      end
    end
  end
  context 'length' do
    it 'valid if length less then 85' do
      str = 'a' * 84
      validator = CityNameValidator::Schema.call(city: str)
      expect(validator.success?).to eq(true)
    end

    it 'invalid if length greater then 85' do
      str = 'a' * 85
      validator = CityNameValidator::Schema.call(city: str)
      expect(validator.success?).to eq(true)
    end
  end
end
