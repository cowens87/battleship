require "minitest/autorun"
require "minitest/pride"
require "./lib/ship.rb"
require "./lib/cell.rb"
require "./lib/board.rb"
require "./lib/game.rb"

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_welcome_message
    game = Game.new

    expected = "Welcome to BATTLESHIP" +
    "Enter p to play. Enter q to quit"

    assert_equal expected, game.welcome_message
  end

end
