class Game
  attr_reader
  def initialize
  end

  def start_game
    puts "Start Game!"
    puts "Welcome to Battleship!"
    puts "Enter p to play. Enter q to quit."
    start_game = gets
    if start_game == p

    elsif start_game == q

    else
      puts "error"
    end

  end
start_game
end
