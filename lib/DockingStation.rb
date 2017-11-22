require_relative 'Bike'
class DockingStation

attr_reader :bike

  def initialize
    @bike_collection = Array.new
  end

  def release_bike
    raise "There are no bikes here" if @bike_collection.empty?
    @bike_collection.pop
  end

  def dock_bike(bike)
      raise "There are already 20 bikes here" if @bike_collection.length >= 20
      @bike_collection << bike
      return "Bike docked"
  end
end
