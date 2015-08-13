FactoryGirl.define do
	factory :appointment do
		status 0
		date_and_time { DateTime.now + Faker::Number.number(3).to_i.days }
		length { Faker::Number.number(2) }
		customer_name { Faker::Name.name }
		customer_phone_number { Faker::PhoneNumber.area_code + Faker::PhoneNumber.exchange_code + Faker::PhoneNumber.subscriber_number }
	end
end