require "DockingStation.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "Creates a new working bike object" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it "Docks a bike" do
    expect(subject.dock_bike).to eq "Bike docked"
  end

  it "Station is already full" do
    subject.dock_bike
    expect(subject.dock_bike).to eq "A bike is already there"
  end

end
