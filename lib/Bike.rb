require_relative 'DockingStation'
require_relative 'Van'
class Bike

  def working?
    true
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

  def initialize

  end

end
