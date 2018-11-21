require 'rails_helper'

describe CreateCityService do
  context 'send correct city name' do
    it 'create new record if not exist' do
      expect(City.all.size).to eq(0)
      CreateCityService.new('barcelona').call
      expect(City.all.size).to eq(1)
    end

    it 'change views counter if exist' do
      City.create!(name: 'warsaw', views: 1)
      CreateCityService.new('warsaw').call
      expect(City.all.size).to eq(1)
      expect(City.find_by(name: 'warsaw').views).to eq(2)
    end
  end
end
