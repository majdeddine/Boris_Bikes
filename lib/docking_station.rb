class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = 0
  end

  def release_bike
    Bike.new
  end

  def dock(arg)
    return arg if arg.instance_of?(Bike)
  end

end
