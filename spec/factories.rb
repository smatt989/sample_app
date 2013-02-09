FactoryGirl.define do
	factory :user do |user|
	  user.name					"Matt Slotkin"
	  user.email					"matt@thetudu.com"
	  user.password				"foobar"
      user.password_confirmation	"foobar"
  end
end