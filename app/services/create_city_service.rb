class CreateCityService
  def initialize(params)
    @city = params.downcase
  end

  def call
    if City.find_by(name: @city).nil?
      City.create!(name: @city, views: 1)
    else
      city = City.find_by(name: @city)
      city.views += 1
      city.save!
    end
  end
end
