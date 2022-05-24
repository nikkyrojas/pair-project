require'./lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  attr_reader
  def initialize
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
  end

  def start_game

    puts "Start Game!"
    puts "Welcome to Battleship!"
    puts "Enter p to play. Enter q to quit."

    user_input = gets.downcase.chomp #changed variable from start_game to avoid using similiar naming as the method

    if user_input == "p"
      create_pc_ship_placement
      player_ship_placement


    elsif user_input == "q"
      puts "Thanks for protecting these here seas!"
    else
      puts "Error: please copy and paste the following link into your web browser for solution: https://www.youtube.com/watch?v=34Ig3X59_qA"
    end
  end


  def create_pc_ship_placement
    pc_board = Board.new
    pc_cruiser = Ship.new("Cruiser", 3)
    pc_submarine = Ship.new("Submarine", 2)

    pc_board.place(pc_cruiser, @hard_valid_cruiser.sample)
    pc_board.place(pc_submarine, @hard_valid_submarine.sample)
  end

  def player_ship_placement
    player_board = Board.new
    player_cruiser = Ship.new("Cruiser", 3)
    player_submarine = Ship.new("Submarine", 2)

    puts "I have laid out my ships on the grid. \n" +
          "You now need to lay out your two ships. (example: a1 a2 a3) \n" +
          "The Cruiser is three units long and the Submarine is two units long. \n"
    puts player_board.render

    puts "Enter the square for the Cruiser (3 spaces):"
    player_cruiser_input = gets.upcase.chomp.split
    if player_board.valid_placement?(player_cruiser, player_cruiser_input) == false
      loop do
        puts "Those are invalid coordinates. Please try again:"
        player_cruiser_input = gets.upcase.chomp.split
        break if player_board.valid_placement?(player_cruiser, player_cruiser_input) == true
      end
      player_board.place(player_cruiser, player_cruiser_input)
      puts player_board.render(true)
    else
      player_board.place(player_cruiser, player_cruiser_input)
      puts player_board.render(true)
    end

    puts "Next please enter the squares for the Submarine (2 spaces): \n"
    player_submarine_input = gets.upcase.chomp.split
    if player_board.valid_placement?(player_submarine, player_submarine_input) == false
      puts "Those are invalid coordinates. Please try again:"
    else
      player_board.place(player_submarine, player_submarine_input)
      puts player_board.render(true)
    end

  end



end
