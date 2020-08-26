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
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")

    assert_equal nil, cell.ship
    assert_equal true, cell.empty?
  end
end
