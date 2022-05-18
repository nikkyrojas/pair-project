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
    if @ship == boat
      ship.hit
    end
  end

  def fired_upon?
    if
      true
    else
      false
    end
  end

  def render
    if empty? == true
      return "."
    elsif fire_upon? == true and @ship == boat
      return "H"
    elsif fire_upon? ==true and @ship != boat
      return "M"
    elsif fire_upon? == true and ship.health == 0
      return "X"

    end
  end


end
