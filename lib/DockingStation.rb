require_relative 'Bike'
class DockingStation

attr_reader :bike

  def release_bike
    raise "There are no bikes here" unless @bike
    @bike
  end

  def dock_bike(bike)
      raise "A bike is already there" if @bike
      @bike = bike
      return "Bike docked"
  end
end
