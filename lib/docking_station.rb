class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes =[]
  end

  def release_bike
    raise("no bikes left!") if empty?
    @docked_bikes.last
  end

  def dock(arg)
    raise("Station is full") if full?
    @docked_bikes << arg if arg.instance_of?(Bike)
  end

  private

  def full?
    return @docked_bikes.size >= 20
  end
 
  def empty?
    return @docked_bikes.empty?
  end 

end
