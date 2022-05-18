require './lib/ship'
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    if @ship == nil
      true
    elsif @ship != nil
      false
    end
  end

  def place_ship(boat)
    @ship = boat
  end

  def fire_upon
    ship.hit
  end

  def fired_upon?
    if ship.health < ship.max_health
      true
    else
      false
    end
  end

  def render
    if empty? == true
      return "."
    end
  end
end
