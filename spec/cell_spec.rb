require './lib/cell'
require './lib/ship'
require 'rspec'

RSpec.describe Cell do
  it "cell exist" do
    cell = Cell.new("B4")

  expect(cell).to be_a(Cell)

  end
end
