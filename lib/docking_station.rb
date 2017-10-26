class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes =[]
  end

  def release_bike
    raise("no bikes left!") if @docked_bikes.empty?
    @docked_bikes.last
  end

  def dock(arg)
    raise("Station is full") if @docked_bikes.size >= 20
    @docked_bikes << arg if arg.instance_of?(Bike)
  end

end
