class Board
  attr_reader :cells, :board_width, :board_height
  def initialize(board_height = 4, board_width = 4)
    # @cells = {
    #     "A1" => Cell.new("A1"),
    #     "A2" => Cell.new("A2"),
    #     "A3" => Cell.new("A3"),
    #     "A4" => Cell.new("A4"),
    #     "B1" => Cell.new("B1"),
    #     "B2" => Cell.new("B2"),
    #     "B3" => Cell.new("B3"),
    #     "B4" => Cell.new("B4"),
    #     "C1" => Cell.new("C1"),
    #     "C2" => Cell.new("C2"),
    #     "C3" => Cell.new("C3"),
    #     "C4" => Cell.new("C4"),
    #     "D1" => Cell.new("D1"),
    #     "D2" => Cell.new("D2"),
    #     "D3" => Cell.new("D3"),
    #     "D4" => Cell.new("D4")
    #   }

    @cells = {}
    @board_height = board_height
    @board_width = board_width

    english_alphabet = "A".."Z"
    alphabet = english_alphabet.to_a #["A", "B", "C"..]
    letters_used = alphabet[0..@board_height - 1]

    numbers = 1..@board_width
    numbers_array = numbers.to_a #[1, 2, 3, 4, 5..]

    string_array_numbers = numbers_array.map do |num|
                           num.to_s #["1", "2", "3", "4"..]
    end

    letters_used.each do |letter| #for each letter..
      string_array_numbers.each do |number| #take each number..
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
        #creates new key/value pair
        #like in our notes.. suitcase["shirts"] = 3
        #would add the key/value pair to the hash, "shirts" => 3
      end
    end
  end #def initialize end

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
