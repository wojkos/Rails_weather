class CityNameValidator
  Schema = Dry::Validation.Schema do
    configure do
      config.messages_file =
        Rails.root.join('config', 'locales', 'validation_errors.en.yml')
    end
    # The longest city name have 85 letters
    required(:city).filled(
      :str?,
      max_size?: 85,
      format?: /\A[\p{L}\s\-\']+\z/
    )
  end
end
