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
end
