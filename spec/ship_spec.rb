require './lib/ship'

RSpec.describe Ship do
  it "exists and has attributes" do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser).to be_a(Ship)
    expect(cruiser.name).to eq("Cruiser")
    expect(cruiser.length).to eq(3)
  end

  it "has health" do
    cruiser = Ship.new("Cruiser", 3)
    
    expect(cruiser.health).to eq(3)
  end

  it "can be sunk" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it "can be hit and lose health" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
    cruiser.hit
    cruiser.hit
    expect(cruiser.health).to eq(0)
    expect(cruiser.sunk?).to eq(true)
  end
end
