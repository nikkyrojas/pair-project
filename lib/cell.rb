require './lib/ship'
class Cell
  attr_reader :coordinate, :ship, :cell_fire_count, :render_status

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_fire_count = 0
    @render_status = "."
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
    @cell_fire_count += 1
    if empty? == false
      ship.hit
    end
  end

  def fired_upon?
    if @cell_fire_count == 0
      false
    elsif @cell_fire_count > 0
      true
    end
  end

  def render(optional = false)
    if optional == true && empty? == false
      @render_status = "S"
    elsif empty? == true && fired_upon? == true
      @render_status = "M"
    elsif empty? == false && fired_upon? == true && ship.sunk? == false
      @render_status = "H"
    elsif empty? == false && fired_upon? == true && ship.sunk? == true
      @render_status = "X"
    else
      @render_status
    end
  end
end
