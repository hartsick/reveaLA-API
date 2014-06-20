require 'rails_helper'

RSpec.describe Spot, :type => :model do
	describe 'data model relationships' do
		it { should have_many(:users) }
		it { should have_many (:user_spots) }
		it { should have_many(:admins) }
		it { should have_many(:admin_spots) }
	end
	describe 'database columns' do
		it { should have_db_column(:name) }
		it { should have_db_column(:type) }
		it { should have_db_column(:street) }
		it { should have_db_column(:city) }
		it { should have_db_column(:state) }
		it { should have_db_column(:zip) }
		it { should have_db_column(:created_by) }
		it { should have_db_column(:point) }
	end
	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:type) }
		it { should validate_presence_of(:street) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:state) }
		it { should validate_presence_of(:zip) }
		it { should validate_presence_of(:created_by) }
		it { should validate_presence_of(:point) }
		it { should validate_length_of(:street).is_at_least(5) }
		it { should validate_length_of(:zip).is_equal_to(5) }
		it { should validate_numericality_of(:zip).only_integer }
	end
	let (:valid_attributes) {{
	:street => '7001 Franklin Ave',
	:city => 'Los Angeles',
	:state => 'CA',
	:zip => '90028' }}
	describe '#address' do
		it 'should combine street, city, state and zip into an address' do
			place = Direction.create! valid_attributes
			@combined_address = place.address
			expect(@combined_address).to eq('7001 Franklin Ave Los Angeles CA 90028')
		end
	end
	describe 'geocoding' do
		it 'should change an address into latitude and longitude' do
			place = Direction.create! valid_attributes
			expect(place.latitude).to eq(34.104489)
			expect(place.longitude).to eq(-118.341708)
		end
	end
end