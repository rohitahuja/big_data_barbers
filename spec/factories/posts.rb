FactoryGirl.define do
	factory :post do
		image { Faker::Avatar.image }
	end
end