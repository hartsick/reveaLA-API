require 'rails_helper'

RSpec.describe Spot, :type => :model do
	describe 'data model relationships' do
		it { should have_many(:users).through(:user_spots) }
		it { should have_many (:user_spots) }
		xit { should have_many(:admins) }
		xit { should have_many(:admin_spots) }
	end
	describe 'database columns' do
		it { should have_db_column(:name) }
		it { should have_db_column(:tag) }
		it { should have_db_column(:street) }
		it { should have_db_column(:city) }
		it { should have_db_column(:state) }
		it { should have_db_column(:zip) }
		xit { should have_db_column(:country) }
		it { should have_db_column(:created_by) }
		it { should have_db_column(:lnglat).of_type(:point) }
	end
	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:tag) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:created_by) }
		xit { should validate_presence_of(:lnglat) }
		xit { should validate_presence_of(:country) }
		it { should validate_length_of(:state).equal_to(2) }
		it { should validate_length_of(:street).greater_than(4) }
		it { should validate_length_of(:zip).is_equal_to(5) }
		it { should validate_numericality_of(:zip).only_integer }
	end

	before(:each) do
		@spot = Spot.create!(street: '7001 Franklin Ave', city: 'Los Angeles', state: 'CA', zip: 90028, name: 'Magic Castle', tag: 'Magical', created_by: 1)
	end

	describe '#address' do
		it 'should combine street, city, state and zip into an address' do
			combined_address = @spot.full_street_address
			expect(combined_address).to eq('7001 Franklin Ave Los Angeles CA 90028')
		end
	end

	describe 'geocoding' do
		before(:each) do
			@spot.full_street_address
		end
		it 'should create object with latitude' do
			expect(@spot.lnglat.x).to eq(34.104489)
		end
		it 'should create object with longitude' do
			expect(@spot.lnglat.y).to eq(-118.341708)
		end
	end
end