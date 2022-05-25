class Cell
  attr_reader :coordinate, :ship, :cell_fire_count, :render_status
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    # @cell_fire_count = 0
    @fired_upon = false
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

  # def fire_upon
  #   @cell_fire_count += 1
  #   if empty? == false && @render_status == "S"
  #     ship.hit
  #     @render_status = "H"
  #   elsif empty? == false && @render_status == "S" && ship.health == 1
  #     ship.hit
  #     @render_status = "X"
  #   elsif @render_status == "."
  #     @render_status = "M"
  #   end
  # end

  def fire_upon
    @fired_upon = true

    # If this cell contains a ship, make sure we hit it
    if !empty?
      @ship.hit
    end
  end

  def fired_upon?
    # if @cell_fire_count == 0
    #   false
    # elsif @cell_fire_count > 0
    #   true
    # end
    @fired_upon
  end
  # def render(optional = false)
  #   if optional == true && empty? == false && fired_upon? == false
  #     @render_status = "S"
  #   elsif optional == true && empty? == false && fired_upon? == true
  #     @render_status = "H"
  #       if ship.sunk? == true
  #         @render_status = "X"
  #       else
  #         @render_status = "H"
  #       end
  #   elsif empty? == true && fired_upon? == true
  #     @render_status = "M"
  #   elsif empty? == false && fired_upon? == true && ship.sunk? == false
  #     @render_status = "H"
  #   elsif empty? == false && fired_upon? == true && ship.sunk? == true
  #     @render_status = "X"
  #   else
  #     @render_status
  #   end
  # end

  def render(reveal = false)
    return "S" if !fired_upon? && !empty? && reveal
    # “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
    return "M" if fired_upon? && empty?
    # “X” if the cell has been fired upon and its ship has been sunk.
    return "X" if fired_upon? and @ship.sunk?
    # “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
    return "H" if fired_upon? && !empty?
    # ”.” if the cell has not been fired upon.
    return "." if !fired_upon?
  end
end
