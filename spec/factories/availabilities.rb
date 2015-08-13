FactoryGirl.define do
	factory :availability do
		day_of_week { Faker::Number.between(0, 6) }
		start_time (Time.now.beginning_of_day + Faker::Number.number(2).to_i.minutes).to_s
		end_time { (start_time.to_datetime.end_of_day - Faker::Number.number(2).to_i.minutes).to_s }
	end
end