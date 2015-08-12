FactoryGirl.define do
	factory :appointment do
		status 0
		date_and_time { DateTime.now + Faker::Number.number(3).to_i.days }
		length { Faker::Number.number(2) }
		customer_name { Faker::Name.name }
		customer_phone_number { Faker::PhoneNumber.phone_number }
	end
end