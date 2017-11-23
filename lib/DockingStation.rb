require_relative 'Bike'
class DockingStation
DEFAULT_CAPACITY = 20
#attr_reader :bike_collection

  def initialize
    @bike_collection = Array.new
  end

  def release_bike
    raise "There are no bikes here" if empty?
    @bike_collection.pop
  end

  def dock_bike(bike)
    raise "There are already #{DEFAULT_CAPACITY} bikes here" if full?
    @bike_collection << bike
  end

private

  def full?
    @bike_collection.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_collection.empty?
  end

end
