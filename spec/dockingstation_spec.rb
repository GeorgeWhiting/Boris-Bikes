require "DockingStation.rb"
require "Bike.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it "Creates a new working bike object" do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
