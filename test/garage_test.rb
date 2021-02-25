require 'minitest/autorun'
require 'minitest/pride'
require './lib/garage'
require './lib/owner'
require './lib/car'

class GarageTest < Minitest::Test
  def setup
    @garage = Garage.new('Totally Safe Parking')

    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Blue Ford Escape')

    @owner_2 = Owner.new('Glen Coco', 'Unknown')
    @owner_2.buy('1963 Green Chevrolet Corvette')
    @owner_2.buy('2020 Silver Volvo XC90')
  end

  def test_it_exists
    assert_instance_of Garage, @garage
  end

  def test_it_has_attributes
    assert_equal 'Totally Safe Parking', @garage.name
    assert_equal [], @garage.customers
  end

  def test_it_can_add_customers
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal [@owner_1, @owner_2], @garage.customers
  end

  def test_can_return_all_cars
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal 4, @garage.all_cars.length
    @garage.all_cars.each do |car|
      assert_instance_of Car, car
    end
  end

  def test_cars_by_make
    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal 2, @garage.cars_by_make["Ford"].length
  end
end
