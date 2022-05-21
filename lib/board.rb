class Board
  attr_reader :cells
  def initialize
    @cells = {
        "A1" => Cell.new("A1"),
        "A2" => Cell.new("A2"),
        "A3" => Cell.new("A3"),
        "A4" => Cell.new("A4"),
        "B1" => Cell.new("B1"),
        "B2" => Cell.new("B2"),
        "B3" => Cell.new("B3"),
        "B4" => Cell.new("B4"),
        "C1" => Cell.new("C1"),
        "C2" => Cell.new("C2"),
        "C3" => Cell.new("C3"),
        "C4" => Cell.new("C4"),
        "D1" => Cell.new("D1"),
        "D2" => Cell.new("D2"),
        "D3" => Cell.new("D3"),
        "D4" => Cell.new("D4")
      }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
    end

  def reverse_element(element)
    element.reverse
  end

  def place(ship, cell_points)
    cell_points.each do |cell_point|
      @cells[cell_point].place_ship(ship)
    end
  end

  def valid_placement? (ship, array_coordinates)
    if ship.length != array_coordinates.count
      false
    elsif ship.length == array_coordinates.count
      is_cell_empty = array_coordinates.map do |array_coordinate|
      @cells[array_coordinate].empty?
      end

        if is_cell_empty.any?(false)
          false

        elsif
          the_keys = @cells.keys
          horizontal_validation = the_keys.each_cons(ship.length).to_a #["A1", "A2"..]..["D2", "D3", "D4"]
          flip_keys = the_keys.map do |key|
             reverse_element(key) #["1A, "2A", "3A"..]
           end
           flip_keys_sorted = flip_keys.sort #["1A, "1B", "1C"..]
           letter_first = flip_keys_sorted.map do |key| #this creates => ["A1", "B1", "C1"..]
             reverse_element(key)
           end
           vertical_validation = letter_first.each_cons(ship.length).to_a

           if horizontal_validation.include?(array_coordinates) || vertical_validation.include?(array_coordinates)
             true
           else
             false
           end
         end
       end
     end
   end

#if @cells has ship return false or if empty = true
