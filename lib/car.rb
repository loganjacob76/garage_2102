class Car
  attr_reader :description,
              :make,
              :model,
              :color,
              :year

  def initialize(details)
    @description = details[:description].split
    @make = @description[1]
    @model = @description[2]
    @color = @description[0]
    @year = details[:year]
  end

  def age
    2021 - @year.to_i
  end
end
