require 'rails_helper'

describe 'Schedule' do
	context 'GET /api/v1/schedule/:id' do
		it 'gets the schedule' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
			availabilities = [
				FactoryGirl.create(:availability, schedule_id: professional_account.schedule.id),
				FactoryGirl.create(:availability, schedule_id: professional_account.schedule.id)
			]

			availability_ids = availabilities.map { |a| a.id }

			get "/api/v1/schedules/#{professional_account.schedule.id}", nil, request_header

			expect(response).to be_success

			expect(json['id']).to eq(professional_account.schedule.id)
			expect(json['availabilities'].uniq.length).to eq(2)

			expect(availability_ids).to include(json['availabilities'][0]['id'].to_i)
			expect(availability_ids).to include(json['availabilities'][1]['id'].to_i)	
		end
	end
  
  context 'PUT /api/v1/schedule/:id' do
  	it 'updates the schedule' do
  		user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
			availabilities = [
				FactoryGirl.create(:availability, day_of_week: 1, schedule_id: professional_account.schedule.id),
				FactoryGirl.create(:availability, day_of_week: 1, schedule_id: professional_account.schedule.id)
			]

			params = {
				schedule: {
					availabilities_attributes: [
						{ id: availabilities[0].id, day_of_week: 3, start_time: availabilities[0].start_time, end_time: availabilities[0].end_time, schedule_id: professional_account.schedule.id },
						{ id: availabilities[1].id, day_of_week: 3, start_time: availabilities[1].start_time, end_time: availabilities[1].end_time, schedule_id: professional_account.schedule.id }
					]
				}
			}

			put "/api/v1/schedules/#{professional_account.schedule.id}", params, request_header

			expect(response).to be_success

			expect(json['availabilities'][0]['day_of_week']).to eq(3)
			expect(json['availabilities'][1]['day_of_week']).to eq(3)
  	end
  end
  
end