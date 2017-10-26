require 'docking_station'

describe DockingStation do
 station = DockingStation.new
   it { is_expected.to respond_to(:release_bike) }

   it 'gets a bike' do
     station.dock(Bike.new)
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

   it 'checks that @docked_bikes is an instance_of Bike'do
     bike = Bike.new
     station.dock(bike)
     expect(station.docked_bikes.last).to be_an_instance_of(Bike)
   end

   it 'checks that @release_bike raise error if #docked_bikes is empty' do 
     expect{ DockingStation.new.release_bike }.to raise_error("no bikes left!")
   end
   
   it 'checks that @dock raise error if a bike is docked already' do 
     testStation = DockingStation.new
     testStation.dock(Bike.new)
     expect{ testStation.dock(Bike.new) }.to raise_error("Station is full")
   end

end
