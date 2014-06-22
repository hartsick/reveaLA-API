FactoryGirl.define do
  factory :user do
  	name "Charles Phoenix"
  	username "iloveLA"
  	email "cphoenix@la.com"
  	password "fakepassword"
  	password_confirmation "fakepassword"
  	is_admin false
  end  
end
