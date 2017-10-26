class Bike
  attr_accessor :condition

  def initialize
    @condition = :working
  end

  def working?
    return @condition == :working
  end

end
