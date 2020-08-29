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
    # computer_placement
    # player_ship_placement
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
    puts @player_board.render

    p 'Enter the squares, without commas, for the Cruiser (3 spaces):'
    user_input = gets.chomp.upcase.split(" ")
      until @player_board.valid_placement?(@player_cruiser, user_input)
        p 'Those are invalid coordinates. Please try again:'
        user_input = gets.chomp.upcase.split(" ")
      end
      @player_board.place(@player_cruiser, user_input)
    puts @player_board.render(true)

    p 'Enter the squares, without commas, for the Submarine (2 spaces):'
    user_input = gets.chomp.upcase.split(" ")
        until @player_board.valid_placement?(@player_submarine, user_input)
          p 'Those are invalid coordinates. Please try again:'
          user_input = gets.chomp.upcase.split(" ")
        end
      @player_board.place(@player_submarine, user_input)
    puts @player_board.render(true)
  end

#-----------TURN

  def display_board
    p "=============COMPUTER BOARD============="
    @computer_board.render
    p "==============PLAYER BOARD=============="
    @player_board.render(true)
  end

  def player_shot
    p 'Enter the coordinate for your shot:'
    user_input = gets.chomp.upcase
    until @computer_board.valid_coordinate?(user_input)
    p 'Please enter a valid coordinate:'
      user_input = gets.chomp.upcase
    end
     shot_input = @computer_board.cells.fetch(user_input)
     shot_input.fire_upon
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

  # def already_fired_upon?#(coordinate)
  #   @computer_board.cells.map do |cell|
  #     cell.fired_upon? == true
  #   end
  # end

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
