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
    start
  end

  def welcome_message
    "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit"
  end

  def start
    puts welcome_message
    if gets.chomp.downcase == 'p'
      run
    else
      puts 'See you next time!'
      exit
    end
  end

  def run
    computer_placement
    player_ship_placement
    until game_over? do
      display_board
      player_shot
      computer_shot
    end
    end_game_message
  end

  def end_game_message
    if player_ships_sunk?
      computer_won_game_message
    else
      player_won_game_message
    end
  end

#-----------SETUP
  def computer_placement
    random_coordinates_cruiser
    random_coordinates_submarine
  end

  def random_coordinates_cruiser
    random_coordinates = @computer_board.cells.keys.sample(3)
      until @computer_board.valid_placement?(@computer_cruiser, random_coordinates)
        random_coordinates = @computer_board.cells.keys.sample(3)
      end
    @computer_board.place(@computer_cruiser, random_coordinates)
  end

  def random_coordinates_submarine
    random_coordinates = @computer_board.cells.keys.sample(2)
      until @computer_board.valid_placement?(@computer_submarine, random_coordinates)
        random_coordinates = @computer_board.cells.keys.sample(2)
      end
    @computer_board.place(@computer_submarine, random_coordinates)
  end

  def player_ship_placement
    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships.'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
    puts @player_board.render

    puts 'Enter the squares, without commas, for the Cruiser (3 spaces):'
    user_input = gets.chomp.upcase.split(" ")
      until @player_board.valid_placement?(@player_cruiser, user_input)
        puts 'Those are invalid coordinates. Please try again:'
        user_input = gets.chomp.upcase.split(" ")
      end
      @player_board.place(@player_cruiser, user_input)
    puts @player_board.render(true)

    puts 'Enter the squares, without commas, for the Submarine (2 spaces):'
    user_input = gets.chomp.upcase.split(" ")
        until @player_board.valid_placement?(@player_submarine, user_input)
          puts 'Those are invalid coordinates. Please try again:'
          user_input = gets.chomp.upcase.split(" ")
        end
      @player_board.place(@player_submarine, user_input)
  end

#-----------TURN

  def display_board
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def result_type_player(cell)
    result_type = ''
    if cell.render == 'M'
      result_type = 'was a miss'
    elsif cell.render == 'X'
      result_type = "sunk the ship"
    elsif cell.render == 'H'
      result_type = 'was a hit'
    else
      'was an invalid coordinate. Please try again.'
    end
    puts "Your shot on #{cell.coordinate} #{result_type}"
  end

  def result_type_computer(cell)
    result_type = ''
    if cell.render == 'M'
      result_type = 'was a miss'
    elsif cell.render == 'X'
      result_type = "sunk the ship"
    elsif cell.render == 'H'
      result_type = 'was a hit'
    end
    puts "My shot on #{cell.coordinate} #{result_type}"
  end

  def player_shot
    puts 'Enter the coordinate for your shot:'
    user_input = gets.chomp.upcase
    until @computer_board.valid_coordinate?(user_input)
      puts 'Please enter a valid coordinate:'
      user_input = gets.chomp.upcase
    end
    @computer_board.cells[user_input].fire_upon
    result_type_player(@computer_board.cells[user_input])
  end

  def computer_shot
    shuffled = @player_board.cells.keys.shuffle[5]
    until @player_board.valid_coordinate?(shuffled)
      shuffled = @player_board.cells.keys.shuffle[5]
    end
    @player_board.cells[shuffled].fire_upon
    result_type_computer(@player_board.cells[shuffled])
  end

  def player_won_game_message
    computer_ships_sunk?
    puts 'You won!'
  end

  def computer_won_game_message
    player_ships_sunk?
    puts 'I won!'
  end

  def player_ships_sunk?
    @player_cruiser.sunk? && @player_submarine.sunk?
  end

  def computer_ships_sunk?
    @computer_cruiser.sunk? && @computer_submarine.sunk?
  end

  def game_over?
    player_ships_sunk? || computer_ships_sunk?
  end
end
