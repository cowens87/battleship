class Game
attr_reader :player_board,
            :player_cruiser,
            :player_submarine,
            :computer_board,
            :computer_cruiser,
            :computer_submarine
  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    computer_placement
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

#-----------SETUP
  def computer_placement
    random_coordinates_cruiser
    random_coordinates_submarine
  end

  def random_coordinates_cruiser
    random_coordinates = []
    3.times do random_coordinates << @computer_board.cells.keys.sample
    end
    if @computer_board.valid_placement?(@computer_cruiser, random_coordinates)
      @computer_board.place(@computer_cruiser, random_coordinates)
    else
      random_coordinates_cruiser
    end
  end

  def random_coordinates_submarine
    random_coordinates = []
    2.times do random_coordinates << @computer_board.cells.keys.sample
    end
    if @computer_board.valid_placement?(@computer_submarine, random_coordinates)
      @computer_board.place(@computer_submarine, random_coordinates)
    else
    random_coordinates_submarine
    end
  end

  def player_ship_placement
    p 'I have laid out my ships on the grid.'
    p 'You now need to lay out your two ships.'
    p 'The Cruiser is three units long and the Submarine is two units long.'
    @player_board.render
    p 'Enter the squares for the Cruiser (3 spaces):'
    #ask player for coordinates
    #place ship unless invalid coordinates
    #if invalid -
    p 'Those are invalid coordinates. Please try again:'
    #if valid -
    @player_board.render
    p "Enter the squares for the Submarine (2 spaces):"
    #ask player for coordinates
    #place ship unless invalid coordinates
    #if invalid -
    p 'Those are invalid coordinates. Please try again:'
  end



#-----------TURN

  def display_board
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "==============PLAYER BOARD=============="
    @player_board.render
  end

  def player_shot
    p 'Enter the coordinate for your shot:'
    p '>'
    #prompt player enters coordinate
    #check if coordinate is valid + already_fired_upon?
    #if invalid
    p 'Please enter a valid coordinate:'
    #prompt player to enter new coordinate
    #else fire_upon that cell
  end

  def computer_shot
    #check for random valid coordinate
    #check if cell has been fired upon
    #fire_upon that cell
  end

  def results
  #p "Your shot on #{player shot} was a #{type of hit}"
  end

  def result_type
    #if statement - possibly use render in cell class
    #handle shot missed // shot hit a ship // shot sunk a ship
  end

  def already_fired_upon?
    #check if player already fired upon a cell
    #if so, prompt for a new coordinate
  end

  def end_game_message
    #if all computer ships sunk
    p 'You won!'
    #if all player ships sunk
    p 'I won!'
  end

  def is_game_over?
    #have all? player ships || computer ships sunk?
  end
end
