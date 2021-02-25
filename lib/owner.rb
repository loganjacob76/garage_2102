class Owner
  attr_reader :name,
              :occupation,
              :cars

  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car)
    year = (car[0..3])
    description = car[5..-1]
    new_car = Car.new({description: description, year: year})
    @cars << new_car
  end

  def vintage_cars
    @cars.find_all do |car|
      car.age >= 25
    end
  end
end
