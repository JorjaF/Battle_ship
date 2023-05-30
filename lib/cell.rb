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

  def render(show_ship = true)
    if @ship == nil && ! fired_upon? 
      "."
    elsif @ship == nil && fired_upon? 
      "M"
    elsif @ship != nil && ! fired_upon? 
      show_ship ? "S" : "."
    elsif @ship != nil && @ship.sunk? 
      "X"
    elsif @ship != nil && fired_upon? 
      "H"
    end
  end
end
