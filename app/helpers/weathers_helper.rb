module WeathersHelper
  def celsius_degree(temp)
    number_with_precision((temp.to_f - 273.15), precision: 2)
  end

  def colored_temp(temp)
    temprature = celsius_degree(temp).to_f
    temp_class = if temprature < 10.0
                   'text-info'
                 elsif temprature >= 10.0 && temprature <= 20.0
                   'text-dark'
                 else
                   'text-danger'
                 end

    content_tag(:p, " Temp: #{temprature} C", class: temp_class)
  end
end
