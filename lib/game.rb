class Game

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def welcome_message
    "Welcome to BATTLESHIP" +
    "Enter p to play. Enter q to quit"
  end

  def start
    welcome_message
    if gets.chomp.downcase == 'p'
      run
    else
      p 'See you next time!'
    end
  end

  def run
    #actually run the turn
  end

  def computer_placement
    @computer_board.each do |cell|
      valid_placement?
    #find cells which are valid for ship type1
    #place Ship
    #do that again for ship type2
  end
  end

  #check board if valid placement ship/coordinates

  def place_random(ship, coordinates)
  #picks out coordinates randomly
  end

  def player_instructions
    p 'I have laid out my ships on the grid.'
    p 'You now need to lay out your two ships.'
    p 'The Cruiser is three units long and the Submarine is two units long.'
    @player_board.render
    p 'Enter the squares for the Cruiser (3 spaces:)'
  end

  def display_board
    #rendering the board after each turn
    #test again in board_test
  end
end
