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
    expect(subject.dock_bike(bike)).to eq "Bike docked"
  end

  it "Station is already full" do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.dock_bike(bike)).to eq "A bike is already there"
  end

  it "Raises an error" do
    expect {subject.release_bike}.to raise_error("There are no bikes here")
  end



end
