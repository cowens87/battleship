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

    assert_nil cell.ship
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
    assert_equal 1, cell.shot_count
    assert_equal true, cell.fired_upon?
  end

  def test_render
    cell_1 = Cell.new("B4")
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    assert_equal ".", cell_1.render
    #Tests if 'M' returns when fired upon and cell is empty
    cell_1.fire_upon
    assert_equal "M", cell_1.render
    #Tests if '.' returns when cell is empty //tests if 'S' returns optional arg true
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
    #Tests if 'H' returns when fired upon and cell is NOT empty
    cell_2.fire_upon
    assert_equal "H", cell_2.render
    assert_equal false, cruiser.sunk?
    #Tests if 'X' returns when fired upon and ship.sunk is true
    cruiser.hit
    cruiser.hit
    assert_equal "X", cell_2.render
  end
end
