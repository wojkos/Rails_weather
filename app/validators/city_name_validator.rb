class CityNameValidator
  Schema = Dry::Validation.Schema do
    CITY_REGEX = %r{[A-Za-z'\-]+}
    configure do
      config.messages_file =
        Rails.root.join('config', 'locales', 'validation_errors.en.yml')

      def city?(value)
        !CITY_REGEX.match(value).nil?
      end
    end
    # The longest city name have 85 letters
    required(:city).filled(max_size?: 85 && city?)
  end
end
