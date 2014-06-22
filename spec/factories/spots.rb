# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spot do
  	name 'Magic Castle'
  	tag 'magical'
  	street '7001 Franklin Ave'
  	city 'Los Angeles'
  	state 'CA'
  	zip '90028'
  	created_by 1
  end
end
