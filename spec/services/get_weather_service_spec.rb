describe GetWeatherService do
  context 'send correct city name' do
    weather = GetWeatherService.new('barcelona').call
    it 'it respond city weather' do
      expect(weather['name']).to eq('Barcelona')
      expect(weather['main']['temp'].is_a?(Float)).to eq(true)
    end
    it 'create new city record' do
      expect(City.find_by(name: 'barcelona').nil?).to eq(false)
    end
  end

  context 'send incorrect city name' do
    weather = GetWeatherService.new('wrong').call
    it 'respond by error message' do
      expect(weather['message']).to eq('city not found')
    end
    it 'don\'t create new record' do
      expect(City.find_by(name: 'wrong').nil?).to eq(true)
    end
  end
end
