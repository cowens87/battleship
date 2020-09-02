class Cell
  attr_reader :coordinate,
              :ship

  attr_accessor :shot_count,
                :fire_upon
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
    @shot_count = 0
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @ship.hit if !empty?
    @fired_upon = true
    @shot_count += 1
  end

  def render(show_ship = nil)
    if fired_upon? && empty?
      'M'
    elsif fired_upon? && @ship.sunk?
      "X"
    elsif fired_upon? && !empty? && !@ship.sunk?
      'H'
    elsif show_ship == true && !empty?
      'S'
    else
      '.'
    end
  end
end
