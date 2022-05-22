class Game
  attr_reader
  def initialize
  end

  def start_game

    puts "Start Game!"
    puts "Welcome to Battleship!"
    puts "Enter p to play. Enter q to quit."

    start_game = gets
    if start_game.chomp == "p" or "P"

      computer_board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      shuffle_coordinates = nil

      loop do
          shuffle_coordinates = @cells.keys.sample(3)

          break if computer_board.valid_placement?(cruiser, shuffle_coordinates) == true
      end


    end #this end is for the if start_game == p

      # if computer_board.valid_placement?(cruiser, shuffle_coordinates) == true
      #
      # computer_board.place(cruiser, @cells.keys.sample(3))
      # computer_board.render


      player_board = Board.new


      until start_game.chomp == "q" or "Q"
      puts "Bye!"
    else
      puts "error"
    end

  end
end
