module SetViewedCities
  extend ActiveSupport::Concern

  included do
    before_action :set_cities 
  end

  def set_cities
    @cities = CitiesArray.new
  end
end