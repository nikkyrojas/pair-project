class Board
  attr_reader :cells, :board_width, :board_height, :valid_coord_array
  def initialize(board_height = 4, board_width = 4)
    @hard_valid_cruiser =[["A1", "A2", "A3"],
                          ["A2", "A3", "A4"],
                          ["B1", "B2", "B3"],
                          ["B2", "B3", "B4"],
                          ["C1", "C2", "C3"],
                          ["C2", "C3", "C4"],
                          ["D1", "D2", "D3"],
                          ["D2", "D3", "D4"],
                          ["A1", "B1", "C1"],
                          ["B1", "C1", "D1"],
                          ["A2", "B2", "C2"],
                          ["B2", "C2", "D2"],
                          ["A3", "B3", "C3"],
                          ["B3", "C3", "D3"],
                          ["A4", "B4", "C4"],
                          ["B4", "C4", "D4"]]
    @hard_valid_submarine = [["A1", "A2"],
                            ["A2", "A3"],
                            ["A3", "A4"],
                            ["B1", "B2"],
                            ["B2", "B3"],
                            ["B3", "B4"],
                            ["C1", "C2"],
                            ["C2", "C3"],
                            ["C3", "C4"],
                            ["D1", "D2"],
                            ["D2", "D3"],
                            ["D3", "D4"],
                            ["A1", "B1"],
                            ["B1", "C1"],
                            ["C1", "D1"],
                            ["A2", "B2"],
                            ["B2", "C2"],
                            ["C2", "D2"],
                            ["A3", "B3"],
                            ["B3", "C3"],
                            ["C3", "D3"],
                            ["A4", "B4"],
                            ["B4", "C4"],
                            ["C4", "D4"]]
    @valid_coord_array = @hard_valid_cruiser + @hard_valid_submarine
    @cells = {}
    @board_height = board_height
    @board_width = board_width

    english_alphabet = "A".."Z"
    alphabet = english_alphabet.to_a #["A", "B", "C"...."X", "Y". "Z"]
    @letters_used = alphabet[0..@board_height - 1]

    numbers = 1..@board_width
    @numbers_array = numbers.to_a #[1, 2, 3, 4, 5..]

    string_array_numbers = @numbers_array.map do |num|
                           num.to_s #["1", "2", "3", "4"..]
    end

    @letters_used.each do |letter| #for each letter..
      string_array_numbers.each do |number| #take each number..
        @cells["#{letter}#{number}"] = Cell.new("#{letter}#{number}")
        #creates new key/value pair. Note in [] has to be a string
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
    elsif ship.length == array_coordinates.count && @valid_coord_array.include?(array_coordinates) == false
      false
    elsif ship.length == array_coordinates.count && @valid_coord_array.include?(array_coordinates) == true
      is_cell_empty = array_coordinates.map do |array_coordinate|
                      @cells[array_coordinate].empty?
      end

        if is_cell_empty.any?(false)
          false
        else
          true
        end 
    end
  end



     def create_the_board(show_the_ship = false)
         if show_the_ship == false
         first_letter_line = @letters_used[0] #A
         second_letter_line = @letters_used[1] #B
         third_letter_line = @letters_used[2] #C
         fourth_letter_line = @letters_used[3] #D

         first_line = @numbers_array.join(' ') #takes [1, 2, 3, 4..] into "1 2 3 4"


         output = "  #{first_line} \n" + #  1 2 3 4
              "#{first_letter_line} #{@cells.values[0].render} " +
              "#{@cells.values[1].render} " +
              "#{@cells.values[2].render} " +
              "#{@cells.values[3].render} \n" +
              "#{second_letter_line} #{@cells.values[4].render} " +
              "#{@cells.values[5].render} " +
              "#{@cells.values[6].render} " +
              "#{@cells.values[7].render} \n" +
              "#{third_letter_line} #{@cells.values[8].render} " +
              "#{@cells.values[9].render} " +
              "#{@cells.values[10].render} " +
              "#{@cells.values[11].render} \n" +
              "#{fourth_letter_line} #{@cells.values[12].render} " +
              "#{@cells.values[13].render} " +
              "#{@cells.values[14].render} " +
              "#{@cells.values[15].render} \n"

          elsif show_the_ship == true
            first_letter_line = @letters_used[0] #A
            second_letter_line = @letters_used[1] #B
            third_letter_line = @letters_used[2] #C
            fourth_letter_line = @letters_used[3] #D

            first_line = @numbers_array.join(' ') #takes [1, 2, 3, 4..] into "1 2 3 4"


            output = "  #{first_line} \n" + #  1 2 3 4
                 "#{first_letter_line} #{@cells.values[0].render(true)} " +
                 "#{@cells.values[1].render(true)} " +
                 "#{@cells.values[2].render(true)} " +
                 "#{@cells.values[3].render(true)} \n" +
                 "#{second_letter_line} #{@cells.values[4].render(true)} " +
                 "#{@cells.values[5].render(true)} " +
                 "#{@cells.values[6].render(true)} " +
                 "#{@cells.values[7].render(true)} \n" +
                 "#{third_letter_line} #{@cells.values[8].render(true)} " +
                 "#{@cells.values[9].render(true)} " +
                 "#{@cells.values[10].render(true)} " +
                 "#{@cells.values[11].render(true)} \n" +
                 "#{fourth_letter_line} #{@cells.values[12].render(true)} " +
                 "#{@cells.values[13].render(true)} " +
                 "#{@cells.values[14].render(true)} " +
                 "#{@cells.values[15].render(true)} \n"
            end
     end

     def render(show_ship = false)
        if show_ship == false
           create_the_board
        elsif show_ship == true
           create_the_board(true)
        end
     end

  end
