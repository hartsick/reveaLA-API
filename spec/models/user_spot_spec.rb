require 'rails_helper'

RSpec.describe UserSpot, :type => :model do
	describe 'data model relationships' do
		it { should belong_to(:user) }
		it { should belong_to(:spot) }
	end
	describe 'database columns' do
		it { should have_db_column(:user_id) }
		it { should have_db_column(:spot_id) }
		it { should have_db_index(:user_id) }
		it { should have_db_index(:spot_id) }
	end
end
