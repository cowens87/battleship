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
end
