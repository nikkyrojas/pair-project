require './lib/ship'
require 'rspec'
require 'pry'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser",3)

  expect(cruiser).to be_a(Ship)
  end

  it 'ship has a name' do
    cruiser = Ship.new("Cruiser",3)

  expect(cruiser.name).to eq("Cruiser")
  end

  it "has a length" do
    cruiser = Ship.new("Cruiser",3)

  expect(cruiser.length).to eq(3)
  end

  it "what is the health" do
    cruiser = Ship.new("Cruiser",3)

    expect(cruiser.health).to eq(3)
  end

  it "has ship sunk?" do
    cruiser = Ship.new("Cruiser",3)

    expect(cruiser.sunk?).to eq(false)
  end

  it "has been hit" do
    cruiser = Ship.new("Cruiser",3)

    expect(cruiser.hit).to eq(2)
    expect(cruiser.hit).to eq(1)
  end

  it "has sunk!" do
    cruiser = Ship.new("Cruiser",3)

    expect(cruiser.hit).to eq(2)
    expect(cruiser.hit).to eq(1)
    expect(cruiser.hit).to eq(0)
    expect(cruiser.sunk?).to eq(true)
  end
end
