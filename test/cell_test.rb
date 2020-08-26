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
end
