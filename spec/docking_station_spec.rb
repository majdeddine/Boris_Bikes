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

   it 'checks if dock receives argument and that argument is instance of Bike' do
     station = DockingStation.new
     bike = Bike.new
     expect(station).to respond_to(:dock).with(1).argument
     expect(station.dock(bike)).to be_an_instance_of(Bike)
   end

   xit 'docked_bikes returns one' do
     station = DockingStation.new
     station.dock(0)
     expect(station.docked_bikes).to eq(0)
   end

   xit 'returns the argument that passed to it' do
     station = DockingStation.new
     bike = Bike.new
     expect(station.dock(bike)).to eq(bike)
   end

end
