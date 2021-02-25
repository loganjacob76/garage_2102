class Garage
  attr_reader :name,
              :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    cars = @customers.map do |customer|
      customer.cars
    end
    cars.flatten
  end

  def cars_by_make
    car_makers = {}
    all_cars.each do |car|
      if car_makers.has_key?(car.make)
        car_makers[car.make] << car
      else
        car_makers[car.make] = [car]
      end
    end
    car_makers
  end
end
