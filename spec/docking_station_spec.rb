require 'docking_station'

describe DockingStation do

   it { is_expected.to respond_to(:release_bike) }

   it 'gets a bike' do
     station = DockingStation.new
     expect(station.release_bike).to be_an_instance_of(Bike)
   end

   it 'responds to dock' do
     station = DockingStation.new
     expect(station).to respond_to(:dock)
   end

   it 'respond to docked_bikes' do
     station = DockingStation.new
     expect(station).to respond_to(:docked_bikes)
   end

   it 'checks if dock receives one argument' do
     station = DockingStation.new
     expect(station).to respond_to(:dock).with(1).argument
     #expect(station.dock(bike)).to be_an_instance_of(Bike)
   end

   it 'checks if @docked_bikes is an array' do
     station = DockingStation.new
     expect(station.docked_bikes).to be_instance_of(Array)
   end

   it 'checks that @docked_bikes is an instance_of Bike'do
     station = DockingStation.new
     bike = Bike.new
     station.dock(bike)
     expect(station.docked_bikes.last).to be_an_instance_of(Bike)
   end

end
