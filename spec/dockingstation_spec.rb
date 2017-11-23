require "DockingStation.rb"

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it "Creates a new working bike object" do
    bike = Bike.new
    expect(bike).to be_working
  end

  it "Docks a bike" do
    bike = Bike.new
    expect(subject.dock_bike(bike)).to include bike
  end

  it "Raises an error when trying to add a bike to a full station" do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(bike)}
    expect {subject.dock_bike(bike)}.to raise_error("There are already 20 bikes here")
  end

  it "Raises an error when trying to remove a bike from an empty station" do
    expect {subject.release_bike}.to raise_error("There are no bikes here")
  end



end
