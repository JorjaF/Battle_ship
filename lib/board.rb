class Board
  attr_reader :cells
  def initialize
    @cells = {
      "A1" => cell = Cell.new("A1"),
      "A2" => cell = Cell.new("A2"),
      "A3" => cell = Cell.new("A3"),
      "A4" => cell = Cell.new("A4"),
      "B1" => cell = Cell.new("B1"),
      "B2" => cell = Cell.new("B2"),
      "B3" => cell = Cell.new("B3"),
      "B4" => cell = Cell.new("B4"),
      "C1" => cell = Cell.new("C1"),
      "C2" => cell = Cell.new("C2"),
      "C3" => cell = Cell.new("C3"),
      "C4" => cell = Cell.new("C4"),
      "D1" => cell = Cell.new("D1"),
      "D2" => cell = Cell.new("D2"),
      "D3" => cell = Cell.new("D3"),
      "D4" => cell = Cell.new("D4")
              }
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_length?(ship, coordinates)
    #ship length to equal coordinate number
    ship.length == coordinates.length
  end

  def consecutive_coordinates?(ship, coordinates)
    collector = []
    coordinates.each do |coordinate|
      sliced_number = coordinate[1]
      collector << sliced_number.to_i
    end
    collector.each_cons(2).all? { |x, y| y == x+1}
  end
end
