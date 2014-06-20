require 'rails_helper'

RSpec.describe User, :type => :model do
	it { should validate_presence_of (:username) }
	it { should validate_presence_of (:name) }
	it { should validate_presence_of (:email) }
	it { should validate_presence_of (:password_digest) }
	
	it { should have_secure_password }

	it { should validate_uniqueness_of(:username).case_insensitive }
	it { should validate_uniqueness_of(:email).case_insensitive }

	it { should ensure_length_of(:password).
		is_at_least(8).
		is_at_most(20).
		with_message(/must be between 8 and 20 characters/) }

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
