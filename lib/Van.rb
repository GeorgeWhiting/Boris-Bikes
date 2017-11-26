require_relative 'Bike'
require_relative 'DockingStation'

class Van

  def initialize
    @bikes = []
  end

  def load_bikes(bike)
    @bikes << bike
  end


end
