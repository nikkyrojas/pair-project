require './lib/ship'
class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @cell_fire_count = 0
    @render_status = nil
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
      @render_status = "M"
    elsif empty? == false && ship.health > 1
      ship.hit
      @cell_fire_count += 1
      @render_status = "H"
    elsif empty? == false && ship.health == 1
      ship.hit
      @cell_fire_count += 1
      @render_status = "X"
    end
  end

  def fired_upon?
    if @cell_fire_count == 0
      false
    elsif @cell_fire_count > 0
      true
    end
  end

  def render(optional = nil)
    if @render_status == "M"
      return "M"
    elsif @render_status == "H"
      return "H"
    elsif @render_status == "X"
      return "X"
    elsif optional == true && empty? == false && fired_upon? == false
      return "S"
    elsif @render_status == nil
      return "."
    end
  end


end
