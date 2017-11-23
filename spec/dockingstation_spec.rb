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
    expect {subject.dock_bike(bike)}.to raise_error("Docking station is full")
  end

  it "Raises an error when trying to remove a bike from an empty station" do
    expect {subject.release_bike}.to raise_error("There are no bikes here")
  end

  describe 'initialisation' do

    it "defaults the capacity to 20 if other capacity not specified" do
      station = subject
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "sets the capacity to 100" do
      station = DockingStation.new 100
      expect(station.capacity).to eq 100
    end

    it 'has a variable capacity' do
      station = DockingStation.new(50)
      50.times { station.dock_bike Bike.new }
      expect { station.dock_bike Bike.new }.to raise_error "Docking station is full"
    end

    it 'has a variable capacity' do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { station.dock_bike Bike.new }
      expect { station.dock_bike Bike.new }.to raise_error "Docking station is full"
    end

  end

end
