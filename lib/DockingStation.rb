require_relative 'Bike'
class DockingStation
DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = Array.new
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes here" if empty?
    raise "Cannot release a broken bike" if @bikes.last.broken?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?

    @bikes << bike
  end

private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
