require 'rails_helper'

describe 'ProfessionalAccount' do
	context 'GET /api/v1/professional_accounts/:id' do
		it 'gets the professional account under the authenticated user' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)

			get "/api/v1/professional_accounts/#{user.professional_account.id}", nil, request_header
			#  needs to be authed

			expect(response).to be_success
			expect(user.professional_account.id).to eq(json['id']) 
		end
	end

	context 'PUT /api/v1/professional_accounts/:id' do
		it 'updates professional account' do
			user = login_user
			workplace = FactoryGirl.create(:workplace)
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id, workplace_id: workplace.id)

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional_account: { phone_number: phone_number } }
			put "/api/v1/professional_accounts/#{professional_account.id}", params, request_header
			#  needs to be authed
			expect(response).to be_success
			expect(json['phone_number']).to eq(phone_number)
			expect(json['workplace']['name']).to eq(workplace.name)
		end

		it 'does not update professional account without request_header' do
			user = login_user
			professional_account = FactoryGirl.create(:professional_account, user_id: user.id)

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional_account: { phone_number: phone_number } }

			put "/api/v1/professional_accounts/#{professional_account.id}", params
			#  needs to be authed
			expect(response).to_not be_success

			expect(json['errors']).to_not be_empty
		end

		it 'does not update the professional account under a different user' do
			user_with_account = FactoryGirl.create(:user)
			professional_account = FactoryGirl.create(:professional_account, user_id: user_with_account.id)

			user_without_account = login_user

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional_account: { phone_number: phone_number } }

			put "/api/v1/professional_accounts/#{user_with_account.professional_account.id}", params, request_header
			#  needs to be authed
			expect(response).to_not be_success

			expect(json['errors']).to_not be_empty
		end
	end	
end