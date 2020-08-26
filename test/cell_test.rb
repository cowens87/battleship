require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"
require './lib/cell'

class Test < Minitest::Test
  def test_it_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_attributes
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_ship_in_cell
    cell = Cell.new("B4")

    assert_equal nil, cell.ship
    assert_equal true, cell.empty?
  end

  def test_place_ship
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
    assert_equal false, cell.empty?
  end

  def test_can_be_fired_upon?
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)
    cell.fire_upon
    assert_equal 2, cell.ship.health
    assert_equal true, cell.fired_upon?
  end
end
