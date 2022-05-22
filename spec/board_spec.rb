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



  it "is NOT coordinate on board" do
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

  it "ship is NOT the same length as number of coordinates in array " do
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

  it "ship coordinates are consecutive" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
  expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
  expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(true)
  expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  expect(board.valid_placement?(submarine, ["C1", "C2"])).to eq(true)
  end

  it "coordinates cannot be diagonal" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it "placing ship in multiple cells" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
  end

  it "placing ship in multiple cells" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship)
  end

  it "no overlapping ships" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    board.valid_placement?(submarine, ["A1", "B1"])
    expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)

  end

  it "renders a board" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      board.place(cruiser, ["A1", "A2", "A3"])
      expect(board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end





end
