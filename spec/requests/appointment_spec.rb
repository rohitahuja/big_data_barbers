require 'rails_helper'

describe 'Appointment' do
	context 'GET /api/v1/professionals/:professional_id/appointments' do
		it 'gets only the appointments under the professional' do
			professional_1 = login_user('professional')
			appointment_1 = FactoryGirl.create(:appointment, schedule_id: professional_1.schedule.id)
		
			professional_2 = FactoryGirl.create(:professional)
			appointment_2 = FactoryGirl.create(:appointment, schedule_id: professional_2.schedule.id)

			get "/api/v1/professionals/#{professional_1.id}/appointments", nil, request_header

			expect(response).to be_success
			expect(json['appointments'].length).to eq(1)
			expect(json['appointments'][0]['id']).to eq(appointment_1.id)
		end
	end

	context 'POST /api/v1/professionals/:professional_id/appointments' do
		it 'creates an appointment under a professional' do
			professional = login_user('professional')
			appointment = FactoryGirl.build(:appointment)

			params = {
				appointment: {
					status: appointment.status,
					date_and_time: appointment.date_and_time,
					length: appointment.length,
					customer_name: appointment.customer_name,
					customer_phone_number: appointment.customer_phone_number,
					schedule_id: professional.schedule.id
				}
			}

			post "/api/v1/professionals/#{professional.id}/appointments", params, request_header

			expect(response).to be_success
			expect(json['customer_name']).to eq(professional.schedule.appointments[0].customer_name)
		end	
	end

	context 'GET /api/v1/appointments/:id' do
		it 'gets the appointment under the user' do
			professional = login_user('professional')
			appointment = FactoryGirl.create(:appointment, schedule_id: professional.schedule.id)

			get "/api/v1/appointments/#{appointment.id}", nil, request_header

			expect(response).to be_success
			expect(json['id']).to eq(appointment.id)
		end

		it 'does not get the appointment under another user' do
			professional_without_appointment = login_user('professional')

			professional_with_appointment = FactoryGirl.create(:professional)
			appointment = FactoryGirl.create(:appointment, schedule_id: professional_with_appointment.schedule.id)

			get "/api/v1/appointments/#{appointment.id}", nil, request_header

			expect(response).to_not be_success
		end		
	end

	context 'PUT /api/v1/appointments/:id' do
		it 'updates the appointment' do
			professional = login_user('professional')
			appointment = FactoryGirl.create(:appointment, schedule_id: professional.schedule.id)

			params = {
				appointment: {
					status: 1
				}
			}

			put "/api/v1/appointments/#{appointment.id}", params, request_header

			expect(response).to be_success
			expect(Appointment.find_by_id(appointment.id).status).to eq(1)
		end
	end
end