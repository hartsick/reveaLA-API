require 'rails_helper'

RSpec.describe Spot, :type => :model do
	it 'has a valid factory' do
		expect(FactoryGirl.build(:spot)).to be_valid
	end
	
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
		it { should have_db_column(:lnglat).of_type(:spatial) }
		it { should have_db_column(:is_approved).with_options(default: false) }
	end
	describe 'validations' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:tag) }
		it { should validate_presence_of(:city) }
		it { should validate_presence_of(:created_by) }
		xit { should validate_presence_of(:country) }
		it { should validate_presence_of(:lnglat).on(:save) }
		it { should validate_presence_of(:is_approved).on(:save) }
		it { should ensure_length_of(:state).is_equal_to(2) }
		it { should ensure_length_of(:street).is_at_least(5) }
		it { should ensure_length_of(:zip).is_equal_to(5) }

		it { should allow_value(true,false).for(:is_approved) }
		it { should_not allow_value(nil).for(:is_approved) }

	end

	before(:each) do
		@spot = FactoryGirl.create(:spot)
	end

	describe '#address' do
		it 'should combine street, city, state and zip into an address' do
			expect(@spot.address).to eq('7001 Franklin Ave Los Angeles CA 90028')
		end
	end

	describe 'geocoding' do
		it 'should create object with correct latitude & longitude' do
			expect(@spot.lnglat.x).to eq(-118.3417063)
			expect(@spot.lnglat.y).to eq(34.1044575)
		end
	end
end