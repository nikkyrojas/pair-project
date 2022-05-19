require './lib/board'
require './lib/ship'
require 'rspec'

RSpec.describe Board do
  it "exists" do
    board = Board.new
    expect(board).to be_a(Board)
  end


end
