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
    if coordinate.count == ship.length
      true
    else
      false
    end
  end
end
