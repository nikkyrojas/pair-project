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
end
