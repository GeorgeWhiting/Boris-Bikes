require 'Bike.rb'

describe Bike do
  it { is_expected.to respond_to :working? }

  it "can report bike as broken" do
    subject.report_broken
    expect(subject).to be_broken
  end

  it "Creates a new working bike object" do
    bike = subject
    expect(bike).to be_working
  end
end
