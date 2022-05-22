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
end
