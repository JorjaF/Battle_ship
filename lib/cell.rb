class Cell
  attr_reader :coordinate, 
              :ship,
              :fire_upon

  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def place_ship(ship)
    @ship = ship
  end  

  def fired_upon?
    @fired_upon
  end

  def fire_upon 
    if @fired_upon == false
      @ship.hit if @ship
      @fired_upon = true
    end
  end

  def render
    if @ship == nil && fired_upon? == false
      "."
    elsif @ship == nil && fired_upon? == true
      "M"
    elsif @ship != nil && fired_upon? == false
      "S"
    elsif @ship != nil && @ship.sunk? == true
      "X"
    elsif @ship != nil && fired_upon? == true
      "H"
    end
  end
end
