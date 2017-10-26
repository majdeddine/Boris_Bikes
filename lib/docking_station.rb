class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes =[]
  end

  def release_bike
    Bike.new
  end

  def dock(arg)
    @docked_bikes << arg if arg.instance_of?(Bike)
  end

end
