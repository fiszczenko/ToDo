# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |user|
	  user.username "Test User"
	  user.email "p@p.pl"
	  user.password "foobar"
	  user.password_confirmation "foobar"
  end
end
