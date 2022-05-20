require './lib/board'
require './lib/ship'
require './lib/cell'
require 'rspec'

RSpec.describe Board do
  it "exists" do
    board = Board.new
  expect(board).to be_a(Board)
  end

  it "has 16 cell objects" do
    board = Board.new
  expect(board.cells.keys.count).to eq(16)
  expect(board.cells.values.count).to eq(16)
  end

  it "is coordinate on board" do
    board = Board.new
  expect(board.valid_coordinate?("A1")).to eq(true)
  expect(board.valid_coordinate?("D4")).to eq(true)
  end



  it "is coordinate on board" do
    board = Board.new
  expect(board.valid_coordinate?("A5")).to eq(false)
  expect(board.valid_coordinate?("A22")).to eq(false)
  end

  it "ship placement is NOT valid" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
  expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "ship coordinates are NOT consecutive" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
  expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
  expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
  expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end
end
