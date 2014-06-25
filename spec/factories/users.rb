FactoryGirl.define do
  factory :user do
  	name "Charles Phoenix"
  	username "iloveLA"
  	email "cphoenix@la.com"
  	password "fakepassword"
  	password_confirmation "fakepassword"
  	is_admin false
  end  

  factory :admin do
  	name "Kyle the Admin"
  	username "administrator"
  	email "admin@la.com"
  	password "fakepassword2"
  	password_confirmation "fakepassword2"
  	is_admin true
  end
end
