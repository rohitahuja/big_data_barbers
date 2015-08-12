require 'rails_helper'

describe 'Appointment' do
	context 'GET /api/v1/professional_accounts/:professional_account_id/appointments' do
		it 'gets only the appointments under the user' do
			user_1 = login_user
			professional_account_1 = FactoryGirl.create(:professional_account, user_id: user_1.id)
			appointment_1 = FactoryGirl.create(:appointment, schedule_id: professional_account_1.schedule.id)
		
			user_2 = FactoryGirl.create(:user)
			professional_account_2 = FactoryGirl.create(:professional_account, user_id: user_2.id)
			appointment_2 = FactoryGirl.create(:appointment, schedule_id: professional_account_2.schedule.id)

			get "/api/v1/professional_accounts/#{professional_account_1.id}/appointments", nil, request_header

			expect(response).to be_success
			expect(json['appointments'].length).to eq(1)
			expect(json['appointments'][0]['id']).to eq(appointment_1.id)
		end
	end

	context 'POST /api/v1/professional_accounts/:professional_account_id/appointments' do
		it 'creates an appointment under a user' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
			appointment = FactoryGirl.build(:appointment)

			params = {
				appointment: {
					status: appointment.status,
					date_and_time: appointment.date_and_time,
					length: appointment.length,
					customer_name: appointment.customer_name,
					customer_phone_number: appointment.customer_phone_number,
					schedule_id: professional_account.schedule.id
				}
			}

			post "/api/v1/professional_accounts/#{professional_account.id}/appointments", params, request_header

			expect(response).to be_success
			expect(json['customer_name']).to eq(professional_account.schedule.appointments[0].customer_name)
		end	
	end

	context 'GET /api/v1/appointments/:id' do
		it 'gets the appointment under the user' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
			appointment = FactoryGirl.create(:appointment, schedule_id: professional_account.schedule.id)

			get "/api/v1/appointments/#{appointment.id}", nil, request_header

			expect(response).to be_success
			expect(json['id']).to eq(appointment.id)
		end

		it 'does not get the appointment under another user' do
			user_without_appointment = login_user
			professional_account_without_appointment = FactoryGirl.create(:professional_account, user_id: user_without_appointment.id)

			user_with_appointment = FactoryGirl.create(:user)
			professional_account_with_appointment = FactoryGirl.create(:professional_account, user_id: user_with_appointment.id)
			appointment = FactoryGirl.create(:appointment, schedule_id: professional_account_with_appointment.schedule.id)

			get "/api/v1/appointments/#{appointment.id}", nil, request_header

			expect(response).to_not be_success
		end		
	end

	context 'PUT /api/v1/appointments/:id' do
		it 'updates the appointment' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)
			appointment = FactoryGirl.create(:appointment, schedule_id: professional_account.schedule.id)

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