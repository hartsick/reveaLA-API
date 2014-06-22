FactoryGirl.define do
  factory :user do
  	name "Charles Phoenix"
  	username "iloveLA"
  	email "cphoenix@la.com"
  	password "fakepassword"
  	password_confirmation "fakepassword"
  	is_admin false
  end  
  # factory :admin do
  # 	name "Charles the Admin"
  # 	username "rulerofworlds"
  # 	email "masteroflife@la.com"
  # 	password "fakepass"
  # 	password_confirmation "fakepass"
  # 	is_admin true
  # end
end
