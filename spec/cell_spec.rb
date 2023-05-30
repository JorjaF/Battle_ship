require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  it "exists and has attributes" do
    cell = Cell.new("B4")
    
    expect(cell).to be_a(Cell)
    expect(cell.coordinate).to eq("B4")
  end

  it "starts with no ship" do
    cell = Cell.new("B4")
    
    expect(cell.ship).to eq(nil)
    expect(cell.empty?).to eq(true)
  end

  it "can place a ship" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    
    cell.place_ship(cruiser)
    
    expect(cell.ship).to eq(cruiser)
    expect(cell.empty?).to eq(false)
  end

  it "can be fired upon" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    
    cell.place_ship(cruiser)
    expect(cell.fired_upon?).to eq(false)
    cell.fire_upon
    
    expect(cell.ship.health).to eq(2)
    expect(cell.fired_upon?).to eq(true)
  end

  it "can render" do
    cell_1 = Cell.new("B4")
    
    cell_1.render
    expect(cell_1.render).to eq(".")

    cell_1.fire_upon
    expect(cell_1.render).to eq("M")

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    cell_2.render

    expect(cell_2.render).to eq("S")

    cell_2.fire_upon
    cell_2.render
    expect(cell_2.render).to eq("H")
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    cruiser.hit
    cruiser.hit
    
    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render).to eq("X")
    end
  end
