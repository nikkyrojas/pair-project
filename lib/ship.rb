require 'pry'
class Ship
  attr_reader :name, :length, :cruiser, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    if @health == 0
      return true
    else
      return false
    end
  end

  def hit

    @health = @health - 1

  end
end
