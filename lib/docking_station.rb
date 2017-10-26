class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes
  attr_accessor :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes =[]
    @capacity = capacity
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
    return @docked_bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    return @docked_bikes.empty?
  end

end
