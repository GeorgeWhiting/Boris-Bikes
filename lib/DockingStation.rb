require_relative 'Bike'
class DockingStation
  def release_bike
    Bike.new
  end

def initialize
  @station_free = true
end

  def dock_bike

    if @station_free == true
      @station_free = false
      return "Bike docked"
    elsif @station_free == false
      return "A bike is already there"
    else
      return "Neither"
    end
  end


end
