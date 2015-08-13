require 'rails_helper'

describe 'Schedule' do
	context 'GET /api/v1/schedule/:id' do
		it 'gets the schedule' do
			professional = login_user('professional')
			availabilities = [
				FactoryGirl.create(:availability, schedule_id: professional.schedule.id),
				FactoryGirl.create(:availability, schedule_id: professional.schedule.id)
			]

			availability_ids = availabilities.map { |a| a.id }

			get "/api/v1/schedules/#{professional.schedule.id}", nil, request_header

			expect(response).to be_success

			expect(json['id']).to eq(professional.schedule.id)
			expect(json['availabilities'].uniq.length).to eq(2)

			expect(availability_ids).to include(json['availabilities'][0]['id'].to_i)
			expect(availability_ids).to include(json['availabilities'][1]['id'].to_i)	
		end
	end
  
  context 'PUT /api/v1/schedule/:id' do
  	it 'updates the schedule' do
  		professional = login_user('professional')
			availabilities = [
				FactoryGirl.create(:availability, day_of_week: 1, schedule_id: professional.schedule.id),
				FactoryGirl.create(:availability, day_of_week: 2, schedule_id: professional.schedule.id)
			]

			params = {
				schedule: {
					availabilities_attributes: [
						{ id: availabilities[0].id, day_of_week: 3 },
						{ id: availabilities[1].id, day_of_week: 4 }
					]
				}
			}

			put "/api/v1/schedules/#{professional.schedule.id}", params, request_header

			expect(response).to be_success

			days_of_week = [3, 4]

			expect(days_of_week).to include(json['availabilities'][0]['day_of_week'])
			expect(days_of_week).to include(json['availabilities'][1]['day_of_week'])
  	end
  end
  
end