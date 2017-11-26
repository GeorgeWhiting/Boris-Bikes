require 'Van'

describe Van do

  it "can store a bike" do
    bike = double(:bike)
    expect(subject.load_bikes(bike)).to include bike
  end

end
