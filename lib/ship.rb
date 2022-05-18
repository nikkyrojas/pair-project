require 'pry'
class Ship
  attr_reader :name, :length, :cruiser, :max_health, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
    @max_health = length
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
