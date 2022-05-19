require './lib/cell'
require './lib/ship'
require 'rspec'

RSpec.describe Cell do
  it "cell exist" do
    cell = Cell.new("B4")

  expect(cell).to be_a(Cell)
  end

  it "coordinate will return value" do
    cell = Cell.new("B4")

  expect(cell.coordinate).to eq("B4")
  end

  it "does cell contain ship" do
    cell = Cell.new("B4")

  expect(cell.ship).to eq(nil)
  end

  it "is cell empty" do
    cell = Cell.new("B4")

  expect(cell.empty?).to eq(true)
  end

  it "places a ship in a cell" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
  expect(cell.place_ship(cruiser)).to eq(cell.ship)
  end

  it "shows the ship in the cell" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
  expect(cell.ship).to eq(cruiser)
  end

  it "tells us if the cell is empty" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
  expect(cell.empty?).to eq(false)
  end

  it "tells us if cell has been fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
  expect(cell.fired_upon?).to eq(false)
  end


  it "tells us that a cell HAS been fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
  expect(cell.fired_upon?).to eq(true)
  end

  it "gives cell_1 a coordinate" do
    cell_1 = Cell.new("B4")

  expect(cell_1).to be_a(Cell)
  end

  it " renders status" do
    cell_1 = Cell.new("B4")

  expect(cell_1.render).to eq(".")
  end

  it "you fired upon empty cell" do
    cell_1 = Cell.new("B4")
    cell_1.fire_upon
  expect(cell_1.render).to eq("M")
  end
end
