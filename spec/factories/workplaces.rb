FactoryGirl.define do
	factory :workplace do
		name { Faker::Lorem.characters(30) }
		address_1 { Faker::Address.street_address }
		address_2 { Faker::Address.secondary_address }
		city { Faker::Address.city }
		zip { Faker::Address.zip }
		state { Faker::Address.state }
		country { Faker::Address.country }
	end
end