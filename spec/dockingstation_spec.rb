require "DockingStation"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end

    it "Raises an error when trying to remove a bike from an empty station" do
      expect {subject.release_bike}.to raise_error("There are no bikes here")
    end

    it "cannot release a broken bike" do
      bike = double(:bike, broken?: true, report_broken: true)
      bike.report_broken
      subject.dock_bike(bike)
      expect{subject.release_bike}.to raise_error "Cannot release a broken bike"
    end
  end

  describe '#dock_bike' do

    it "docks a bike" do
      bike = double(:bike)
      expect(subject.dock_bike(bike)).to include bike
    end

    it "raises an error when trying to add a bike to a full station" do
      bike = double(:bike)
      DockingStation::DEFAULT_CAPACITY.times {subject.dock_bike(bike)}
      expect {subject.dock_bike(bike)}.to raise_error("Docking station is full")
    end

    it "accepts broken bikes" do
      bike = double(:bike, report_broken: true)
      bike.report_broken
      expect(subject.dock_bike(bike)).to include bike
    end

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
      50.times { station.dock_bike double(:bike) }
      expect { station.dock_bike double(:bike) }.to raise_error "Docking station is full"
    end

    it 'has a variable capacity' do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { station.dock_bike double(:bike) }
      expect { station.dock_bike double(:bike) }.to raise_error "Docking station is full"
    end

  end

end
