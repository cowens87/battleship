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

  def test_game_has_boards_and_players
    game = Game.new

    assert_instance_of  Board, game.player_board
    assert_instance_of  Ship, game.player_cruiser
    assert_instance_of  Ship, game.player_submarine
    assert_instance_of  Board, game.computer_board
    assert_instance_of  Ship, game.computer_cruiser
    assert_instance_of  Ship, game.computer_submarine
  end

  def test_random_coordinates_valid?
    game = Game.new
    expected = game.player_board.cells.keys.shuffle[5]
  require 'pry'; binding.pry
    assert_equal expected.count, (game.player_board.cells.keys.shuffle[5]).count
  end


end
