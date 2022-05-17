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

end
