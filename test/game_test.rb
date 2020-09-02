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

    expected = "Welcome to BATTLESHIP \n" +
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

  def test_player_ship_sunk
    game = Game.new

    game.player_board.place(game.player_cruiser, ["A1", "A2", "A3"])
    game.player_board.place(game.player_submarine, ["B2", "B3"])

    assert_equal false, game.player_ships_sunk?

    game.player_board.cells["A1"].fire_upon
    game.player_board.cells["A2"].fire_upon
    game.player_board.cells["A3"].fire_upon
    game.player_board.cells["B2"].fire_upon
    game.player_board.cells["B3"].fire_upon

    assert_equal true, game.player_ships_sunk?
  end

  def test_computer_ship_sunk
    game = Game.new

    game.computer_board.place(game.computer_cruiser, ["A1", "A2", "A3"])
    game.computer_board.place(game.computer_submarine, ["B2", "B3"])

    assert_equal false, game.computer_ships_sunk?

    game.computer_board.cells["A1"].fire_upon
    game.computer_board.cells["A2"].fire_upon
    game.computer_board.cells["A3"].fire_upon
    game.computer_board.cells["B2"].fire_upon
    game.computer_board.cells["B3"].fire_upon

    assert_equal true, game.computer_ships_sunk?
  end

  def test_game_over
    game = Game.new

    game.computer_board.place(game.computer_cruiser, ["A1", "A2", "A3"])
    game.computer_board.place(game.computer_submarine, ["B2", "B3"])

    assert_equal false, game.game_over?

    game.computer_board.cells["A1"].fire_upon
    game.computer_board.cells["A2"].fire_upon
    game.computer_board.cells["A3"].fire_upon
    game.computer_board.cells["B2"].fire_upon 
    game.computer_board.cells["B3"].fire_upon

    assert_equal true, game.game_over?
  end
end
