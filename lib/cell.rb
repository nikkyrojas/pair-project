require './lib/ship'
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_fire_count = 0
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
    if empty? == true
      @cell_fire_count += 1
       "M"
    elsif empty? == false && ship.health > 1
      ship.hit
      @cell_fire_count += 1
       "H"
    elsif empty? == false && ship.health >= 0
      @cell_fire_count += 1
       "X"
    end
  end

  def fired_upon?
    if @cell_fire_count == 0
      false
    elsif @cell_fire_count > 0
      true
    end
  end

  def render
    if fire_upon == "M"
      return "M"
    elsif fire_upon == "H"
      return "H"
    elsif fire_upon == "X"
      return "X"
    else
        return "."

    end
  end


end
