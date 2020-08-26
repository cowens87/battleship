require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"

class Test < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end

  def test_it_has_attributes
    cruiser = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", cruiser.name
    assert_equal 3, cruiser.length
  end

  def test_it_has_health
    cruiser = Ship.new("Cruiser", 3)

    assert_equal 3, cruiser.health
  end

  def test_ship_can_sink
    cruiser = Ship.new("Cruiser", 3)

    refute cruiser.sunk?
  end

  def test_ship_hit
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    assert_equal 2, cruiser.health

    cruiser.hit
    assert_equal 1, cruiser.health
    refute cruiser.sunk?

    cruiser.hit
    assert cruiser.sunk?
  end
end
