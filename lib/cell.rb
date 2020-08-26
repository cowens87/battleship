class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    if self.ship == nil
      true
    else
      false
    end
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
  end

  def render(show_ship = nil)
    if fired_upon? && empty?
      'M'
    elsif fired_upon? && @ship.sunk?
      "X"
    elsif fired_upon? && !empty?
      'H'
    elsif show_ship == true
      'S'
    else
      '.'
    end
  end
end
