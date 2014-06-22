require 'rails_helper'

RSpec.describe User, :type => :model do
	it 'has a valid factory' do
		expect(FactoryGirl.build(:user)).to be_valid
	end
	it { should validate_presence_of (:username) }
	it { should validate_presence_of (:name) }
	it { should validate_presence_of (:email) }
	it { should validate_presence_of (:password_digest) }
	
	it { should have_secure_password }

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

	it { should have_many(:spots).through(:user_spots) }
	it { should have_many(:user_spots) }

  it "requires an email that is actually an address" do
  	@user = User.new(:email => "bob@bobcom", :password => "oldmeat", :password_confirmation => "oldmeat")
    expect(@user).to be_invalid
  end

end
