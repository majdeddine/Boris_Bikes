class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes
  attr_accessor :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes =[]
    @capacity = capacity
  end

  def release_bike #don't release broken
    raise("no bikes left!") if empty?   

    @docked_bikes.each do |bike|
      return @docked_bikes.delete(bike) if bike.working?
    end
    raise("No working bikes available")    
  end

  def dock(bike, state="working")
    raise("Station is full") if full?
    bike.condition = :broken if state == "broken"
    @docked_bikes << bike if bike.instance_of?(Bike)
  end

  private

  def full?
    return @docked_bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    return @docked_bikes.empty?
  end

end
