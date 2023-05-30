require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do
  it "exists and has attributes/cells" do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
    expect(board.cells).to be_a (Hash)
  end
  it "can validate coordinates" do
    board = Board.new

    expect(board.valid_coordinate?(["A1"])).to eq(true)
    expect(board.valid_coordinate?(["D4"])).to eq(true)
    expect(board.valid_coordinate?(["A5"])).to eq(false)
    expect(board.valid_coordinate?(["E1"])).to eq(false)
    expect(board.valid_coordinate?(["A22"])).to eq(false)
    
  end
  
  it "has a valid length" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_length?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_length?(submarine, ["A2", "A3", "A4"])).to eq(false)
    expect(board.valid_length?(cruiser, ["A2", "A3", "A4"])).to eq(true)
  end

  it "has consecutive coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.consecutive_coordinates?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.consecutive_coordinates?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.consecutive_coordinates?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.consecutive_coordinates?(submarine, ["A1", "A2"])).to eq(true)
  end

  it "has horizontal and vertical coordinates" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.horizonal_or_vertical?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.horizonal_or_vertical?(submarine, ["C2", "D3"])).to eq(false)
    expect(board.horizonal_or_vertical?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.horizonal_or_vertical?(cruiser, ["A1", "A2", "A3"])).to eq(true)
  end

  it "has valid placement" do
      board = Board.new
      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)
  
      expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true) 
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "A2", "C3"])).to eq(false)
      expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
      expect(board.valid_placement?(cruiser, ["C3", "C4", "C5"])).to eq(false)
      # can we place something on C3, C4, C5? other edge case?
  end

  it "can place ships" do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end

  it "won't overlap ships" do
  board = Board.new
  cruiser = Ship.new("Cruiser", 3)
  submarine = Ship.new("Submarine", 2)

  board.place(cruiser, ["A1", "A2", "A3"])
  
  expect(board.valid_placement?(submarine, ["A1", "B1"])).to eq(false)
  expect(board.overlap?(submarine, ["A1", "B1"])).to eq(true) 
  end
end
