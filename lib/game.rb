require'./lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

class Game
  def initialize
    @pc_board = nil
    @pc_cruiser = nil
    @pc_submarine = nil
    @pc_shot_random_coordinate = nil

    @player_board = nil
    @player_cruiser = nil
    @player_submarine = nil
    @@player_shot_input = nil

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
    loop do
      puts "Start Game!"
      puts "Welcome to Battleship!"
      puts "Enter p to play. Enter q to quit."

      user_input = gets.downcase.chomp #changed variable from start_game to avoid using similiar naming as the method

      if user_input == "p"
          create_pc_ship_placement
          player_ship_placement
          loop do
            computer_and_player_screen
            player_shot
            pc_shot
            player_miss_hit_sunk_response
            pc_miss_hit_sunk_response
          break if (@player_cruiser.sunk? == true && @player_submarine.sunk? == true) || (@pc_cruiser.sunk? == true && @pc_submarine.sunk? == true)
        end
        if @player_cruiser.sunk? == true && @player_submarine.sunk? == true
          puts "I won!"
        elsif
          puts "You won!"
        end
      elsif user_input == "q"
        puts "Thanks for protecting these here seas!"
      else
        puts "Error: please copy and paste the following link into your web browser for solution: https://www.youtube.com/watch?v=34Ig3X59_qA"
      end
      break if user_input == "q"
    end
  end

  def create_pc_ship_placement
    @pc_board = Board.new
    @pc_cruiser = Ship.new("Cruiser", 3)
    @pc_submarine = Ship.new("Submarine", 2)

    pc_cruiser_placement_choice = @hard_valid_cruiser.sample
    @pc_board.place(@pc_cruiser, pc_cruiser_placement_choice)


    pc_submarine_placement_choice = nil
      loop do
        pc_submarine_placement_choice = @hard_valid_submarine.sample
        break if @pc_board.valid_placement?(@pc_submarine, pc_submarine_placement_choice) == true
      end
      @pc_board.place(@pc_submarine, @hard_valid_submarine.sample)
    end

  def player_ship_placement
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)

    puts "I have laid out my ships on the grid. \n" +
          "You now need to lay out your two ships. (example: a1 a2 a3) \n" +
          "The Cruiser is three units long and the Submarine is two units long. \n"
    puts @player_board.render

    puts "Enter the square for the Cruiser (3 spaces):"
    player_cruiser_input = gets.upcase.chomp.split
    if @player_board.valid_placement?(@player_cruiser, player_cruiser_input) == false
      loop do
        puts "Those are invalid coordinates. Please try again:"
        player_cruiser_input = gets.upcase.chomp.split
        break if @player_board.valid_placement?(@player_cruiser, player_cruiser_input) == true
      end
      @player_board.place(@player_cruiser, player_cruiser_input)
      puts @player_board.render(true)
    else
      @player_board.place(@player_cruiser, player_cruiser_input)
      puts @player_board.render(true)
    end

    puts "Next please enter the squares for the Submarine (2 spaces): \n"
    player_submarine_input = gets.upcase.chomp.split
    if @player_board.valid_placement?(@player_submarine, player_submarine_input) == false
      loop do
        puts "Those are invalid coordinates. Please try again:"
        player_submarine_input = gets.upcase.chomp.split
        break if @player_board.valid_placement?(@player_submarine, player_submarine_input) == true
      end
      @player_board.place(@player_submarine, player_submarine_input)
      puts @player_board.render(true)
    else
      @player_board.place(@player_submarine, player_submarine_input)
      puts @player_board.render(true)
    end
  end #the end for player ship placement method

  def computer_and_player_screen
    puts "=============COMPUTER BOARD============= \n" +
         "#{@pc_board.render} \n" +
         "==============PLAYER BOARD============== \n" +
         "#{@player_board.render(true)}"
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    @player_shot_input = gets.upcase.chomp
    if @pc_board.valid_coordinate?(@player_shot_input) == true && @pc_board.cells[@player_shot_input].fired_upon? == false
      @pc_board.cells[@player_shot_input].fire_upon
    elsif @pc_board.valid_coordinate?(@player_shot_input) == true && @pc_board.cells[@player_shot_input].fired_upon? == true
      loop do
        puts "You have already fired upon that coordinate. Please enter a different coordinate:"
        @player_shot_input = gets.upcase.chomp
        break if @pc_board.valid_coordinate?(@player_shot_input) == true && @pc_board.cells[@player_shot_input].fired_upon? == false
      end
      @pc_board.cells[player_shot].fire_upon
    else
      loop do
        puts "Please enter a valid coordinate:"
        @player_shot_input = gets.upcase.chomp
        break if @pc_board.valid_coordinate?(@player_shot_input) == true
      end
      @pc_board.cells[player_shot].fire_upon
    end
  end

  def pc_shot
    loop do
    @pc_shot_random_coordinate = @player_board.cells.keys.sample
    break if @player_board.cells[@pc_shot_random_coordinate].fired_upon? == false
      end
    @player_board.cells[@pc_shot_random_coordinate].fire_upon
  end

  def player_miss_hit_sunk_response
    if @pc_board.cells[@player_shot_input].render == "X"
       puts "Your shot on #{@player_shot_input} sunk their ship."
     elsif @pc_board.cells[@player_shot_input].render == "M"
       puts "Your shot on #{@player_shot_input} was a miss."
     elsif @pc_board.cells[@player_shot_input].render == "H"
       puts "Your shot on #{@player_shot_input} was a hit."
     else
       puts "ERROR: Render status was #{@pc_board.cells[@player_shot_input].render_status}"
     end
  end

  def pc_miss_hit_sunk_response
    if @player_board.cells[@pc_shot_random_coordinate].render == "X"
       puts "My shot on #{@pc_shot_random_coordinate} sunk your ship."
     elsif @player_board.cells[@pc_shot_random_coordinate].render == "M"
       puts "My shot on #{@pc_shot_random_coordinate} was a miss."
     elsif @player_board.cells[@pc_shot_random_coordinate].render == "H"
       puts "My shot on #{@pc_shot_random_coordinate} was a hit."
     else
       puts "ERROR: Render status was #{@player_board.cells[@pc_shot_random_coordinate].render_status}"
     end
   end
end
