require_relative 'Bike'
class DockingStation
DEFAULT_CAPACITY = 20
attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bike_collection = Array.new
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes here" if empty?
    @bike_collection.pop
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    @bike_collection << bike
  end

private

  def full?
    @bike_collection.length >= @capacity
  end

  def empty?
    @bike_collection.empty?
  end

end
