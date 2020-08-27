class Board
attr_accessor :cells, :coordinates
  def initialize
    @cells = create_cells
    @coordinates = coordinates
  end

  def create_cells
    new_hash = {}
    coordinates = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    coordinates.each do |coordinate|
      new_hash[coordinate] = Cell.new(coordinate)
    end
    new_hash
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinate)
    same_length?(ship, coordinate) && is_vertical_or_horizontal?(coordinate) && !is_diagonal?(coordinate)
  end

  def same_length?(ship, coordinate)
    coordinate.count == ship.length
  end

  def is_horizontal?(coordinate)
     letters = coordinate.map do |letter|
        letter[0]
      end
     range = letters[0]..letters[-1]
     letters == range.to_a
  end

  def is_vertical?(coordinate)
    numbers = coordinate.map do |number|
      number[-1]
    end
    range = numbers[0]..numbers[-1]
    numbers == range.to_a
  end

  def is_vertical_or_horizontal?(coordinate)
    is_horizontal?(coordinate) || is_vertical?(coordinate)
  end

  def is_diagonal?(coordinate)
    is_horizontal?(coordinate) && is_vertical?(coordinate)
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end
end
