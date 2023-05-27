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

    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
    
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
end