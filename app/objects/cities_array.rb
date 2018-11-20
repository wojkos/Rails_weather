class CitiesArray
  attr_accessor :cities
  def initialize
    @cities = %w[Warsaw Berlin Tokio Paris New\ York]
  end

  def add(city)
    cities = self.cities 
    unless cities.include?(city.capitalize)
      if cities.length > 10
        cities.shift
      end
      cities << city.capitalize
    end
    self.cities = cities
  end
end