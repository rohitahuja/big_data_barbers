FactoryGirl.define do
	factory :professional do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		password { Faker::Internet.password(8) }
		phone_number { Faker::PhoneNumber.phone_number }
		bio { Faker::Lorem.paragraph(10) }
	end
end