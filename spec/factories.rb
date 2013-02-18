FactoryGirl.define do
	factory :user do |user|
	  user.name					"Matt Slotkin"
	  user.email					"fake@fake.com"
	  user.password				"foobar"
      user.password_confirmation	"foobar"
    end
end

FactoryGirl.define do
	factory :micropost do |micropost|
		micropost.content "Foo bar"
		micropost.association :user
	end
end
