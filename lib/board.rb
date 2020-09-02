class Board
  attr_accessor :cells,
                :coordinates
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
    @cells.has_key?(coordinate) && !@cells[coordinate].fired_upon?
  end

  def valid_placement?(ship, coordinate)
    coordinate.all? {|coordinate| valid_coordinate?(coordinate)} &&
    same_length?(ship, coordinate) &&
    is_vertical_or_horizontal?(coordinate) &&
    !is_diagonal?(coordinate) &&
    is_overlapping?(coordinate)
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

  def letters_same?(coordinate)
    letters = coordinate.map do |letter|
                letter[0]
              end
    letters.uniq.length == 1
  end

  def numbers_same?(coordinate)
    numbers = coordinate.map do |number|
                number[-1]
              end
    numbers.uniq.length == 1
  end

  def is_vertical_or_horizontal?(coordinate)
    is_horizontal?(coordinate) && numbers_same?(coordinate)|| is_vertical?(coordinate) && letters_same?(coordinate)
  end

  def is_diagonal?(coordinate)
    is_horizontal?(coordinate) && is_vertical?(coordinate)
  end

  def is_overlapping?(coordinate)
    coordinate.select.all? {|coordinate| @cells[coordinate].empty?}
  end

  def place(ship, coordinate)
    if valid_placement?(ship, coordinate)
      coordinate.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render_cells
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
  end

  def render_show_ship_true
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render(true)} #{@cells["A2"].render(true)} #{@cells["A3"].render(true)} #{@cells["A4"].render(true)} \n" +
    "B #{@cells["B1"].render(true)} #{@cells["B2"].render(true)} #{@cells["B3"].render(true)} #{@cells["B4"].render(true)} \n" +
    "C #{@cells["C1"].render(true)} #{@cells["C2"].render(true)} #{@cells["C3"].render(true)} #{@cells["C4"].render(true)} \n" +
    "D #{@cells["D1"].render(true)} #{@cells["D2"].render(true)} #{@cells["D3"].render(true)} #{@cells["D4"].render(true)} \n"
  end

  def render(show_ship = nil)
    if show_ship == true
      return render_show_ship_true
    else
      render_cells
    end
  end
end
