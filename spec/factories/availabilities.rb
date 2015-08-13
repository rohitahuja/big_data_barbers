FactoryGirl.define do
	factory :availability do
		day_of_week { Faker::Number.between(0, 6) }
		start_time { Faker::Time.between(DateTime.now, DateTime.now + Faker::Number.number(3).to_i.days) }
		end_time { Faker::Time.between(start_time + 1.minutes, start_time + Faker::Number.number(3).to_i.days) }
	end
end