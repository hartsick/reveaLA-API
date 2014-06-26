require 'rails_helper'

RSpec.describe User, :type => :model do
	it 'has a valid factory' do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	it { should validate_presence_of(:username) }
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password_digest).on(:save) }
	it { should validate_presence_of(:is_admin).on(:save) }
	it { should validate_presence_of(:is_guest).on(:save) }
	
	it { should have_secure_password }

	it { should respond_to(:can_create?) }
	it { should respond_to(:can_update?) }
	it { should respond_to(:can_destroy?) }
	it { should respond_to(:token) }

	it 'username should not be approved if not unique' do
		unique = FactoryGirl.create(:user, email: 'a@aol.com')
		notunique = FactoryGirl.build(:user, email: 'a@aol.com')
		expect(notunique).to be_invalid
	end

	it 'username should pass if unique' do
		unique = FactoryGirl.create(:user)
		notunique = FactoryGirl.build(:user, username: 'revealLAfan' ,email: 'a@aol.com')
		expect(notunique).to be_valid
	end

	it 'email should not be approved if not unique' do
		unique = FactoryGirl.create(:user, username: 'reveaLAfan')
		notunique = FactoryGirl.build(:user, username: 'reveaLAfan')
		expect(notunique).to be_invalid
	end

	it 'email should pass if unique' do
		unique = FactoryGirl.create(:user)
		notunique = FactoryGirl.build(:user, username: 'reveaLAfan', email: 'a@aol.com')
		expect(notunique).to be_valid
	end

	it { should have_db_column(:username) }
	it { should have_db_column(:name) }
	it { should have_db_column(:email) }
	it { should have_db_column(:password_digest) }
	it { should have_db_column(:is_admin).with_options(default: false) }
	it { should have_db_column(:is_guest).with_options(default: true) }
	it { should have_db_column(:token)}

	it { should have_many(:spots).through(:user_spots) }
	it { should have_many(:user_spots) }

  it "requires an email that is actually an address" do
  	@user = User.new(:email => "bob@bobcom", :password => "oldmeat", :password_confirmation => "oldmeat")
    expect(@user).to be_invalid
  end

  describe 'permissions' do
		it { should respond_to(:can_create?) }
		it { should respond_to(:can_update?) }
		it { should respond_to(:can_destroy?) }

		describe 'for admin' do
			before(:each) do
				@admin = FactoryGirl.build(:user, is_admin: true)
				@spot = FactoryGirl.create(:spot)
			end
			it 'should allow create' do
				expect(@admin.can_create?(@spot)).to eq(true)
			end			
			it 'should not allow update' do
				expect(@admin.can_update?(@spot)).to eq(true)
			end			
			it 'should not allow destroy' do
				expect(@admin.can_destroy?(@spot)).to eq(true)
			end
		end

		describe 'for logged in user' do
			before(:each) do
				@user = FactoryGirl.create(:user)
				@spot = FactoryGirl.create(:spot)
			end
			it 'should allow create' do
				expect(@user.can_create?(@spot)).to eq(true)
			end			
			it 'should not allow update' do
				expect(@user.can_update?(@spot)).to eq(false)
			end			
			it 'should not allow destroy' do
				expect(@user.can_destroy?(@spot)).to eq(false)
			end
		end

		describe 'for guest' do
			before(:each) do
				@guest = FactoryGirl.create(:guest)
				@spot = FactoryGirl.create(:spot)
			end
			it 'should allow create' do
				expect(@guest.can_create?(@spot)).to eq(false)
			end			
			it 'should not allow update' do
				expect(@guest.can_update?(@spot)).to eq(false)
			end			
			it 'should not allow destroy' do
				expect(@guest.can_destroy?(@spot)).to eq(false)
			end
		end
  end

end
