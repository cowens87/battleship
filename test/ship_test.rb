require "minitest/autorun"
require "minitest/pride"
require "./lib/ship"

class Test < Minitest::Test

  def test_it_exists
    cruiser = Ship.new("Cruiser", 3)

    assert_instance_of Ship, cruiser
  end
end
