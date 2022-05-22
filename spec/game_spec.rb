require'./lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
require 'rspec'

RSpec.describe Game do
  it "exist" do
    game = Game.new
  expect(game).to be_a(Game)
  end

  it "what are the random generated coordinates for computer" do
    computer_board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    expect().to eq(shuffle_coordinates)

  end

  it "is the computer placement valid" do
    computer_board = Board.new
    cruiser = Ship.new("Cruiser", 3)

  end
end
