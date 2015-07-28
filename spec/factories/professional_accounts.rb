FactoryGirl.define do
	factory :professional_account do
		phone_number { Faker::PhoneNumber.phone_number }
		bio { Faker::Lorem.paragraph(10) }
	end
end