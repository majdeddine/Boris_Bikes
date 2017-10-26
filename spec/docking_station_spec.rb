require 'docking_station'

describe DockingStation do
 station = DockingStation.new
 let(:bike) { double :bike }

   it { is_expected.to respond_to(:release_bike) }

   it 'gets a bike' do
     allow(bike).to receive(:instance_of?).with(anything()) { true } 
     allow(bike).to receive(:working?) { true } 
     station.dock bike
     expect(station.release_bike).to be_an_instance_of(Bike)
   end

   it 'responds to dock' do
     expect(station).to respond_to(:dock)
   end

   it 'respond to docked_bikes' do
     expect(station).to respond_to(:docked_bikes)
   end

   it 'checks if dock receives one argument' do
     expect(station).to respond_to(:dock).with(1).argument
   end

   it 'checks if @docked_bikes is an array' do
     expect(station.docked_bikes).to be_instance_of(Array)
   end

#   it 'checks that @docked_bikes is an instance_of Bike'do
#     bike = Bike.new
#     station.dock(bike)
#     expect(station.docked_bikes.last).to be_an_instance_of(Bike)
#   end

   it 'checks that @release_bike raise error if #docked_bikes is empty' do
     expect{ DockingStation.new.release_bike }.to raise_error("no bikes left!")
   end

   it 'checks that @dock raise error if 20 bikes are docked already' do
     allow(bike).to receive(:instance_of?).with(anything()) { true } 
     testStation = DockingStation.new
     expect{ (DockingStation::DEFAULT_CAPACITY + 1).times{testStation.dock bike} }.to raise_error("Station is full")
   end

   it 'sets station capacity to 30 when station is created with argument 30' do
     expect(DockingStation.new(30).capacity).to eq 30
   end

  it 'sets station capacity to 20 if no argument is passed' do
    expect(DockingStation.new.capacity).to eq 20
  end

  it '#dock should accept argument broken' do
    expect{ DockingStation.new.dock(double(:bike),"broken") }.to_not raise_error
  end

  it '#release_bike should not release broken bike' do
    station = DockingStation.new
    bike = double(:bike)
    bike.condition = :broken
    station.dock(bike)
    expect{ station.release_bike }.to raise_error("No working bikes available")
  end

end
