require 'rails_helper'

describe 'Professional' do

	# Session specs
	context 'POST /api/v1/auth_professional/sign_in' do
		it 'signs in successfully' do
			professional = login_user('professional')

	    expect(response).to be_success
	    expect(json['data']['email']).to eq(professional.email) # check to make sure the right amount of messages are returned
	  end

	  it 'does not sign in with wrong credentials' do
	  	# will not create a user
	  	params = { email: Faker::Internet.email, password: Faker::Internet.password }

	  	post '/api/v1/auth_professional/sign_in', params
	  	expect(response).to_not be_success
	  	expect(json['errors']).to_not be_empty
	  end
	end
  
  context 'DELETE /api/v1/auth_professional/sign_out' do
  	it 'signs out successfully' do
			professional = login_user('professional')

	  	delete '/api/v1/auth_professional/sign_out', nil, request_header
	  	expect(response).to be_success
	  end

	  it 'does not sign out when not initially signed in' do
			professional = FactoryGirl.create(:professional)

	  	delete '/api/v1/auth_professional/sign_out'
	  	expect(response).to_not be_success
	  	expect(json['errors']).to_not be_empty
	  end
  end

  # Resource specs
  context 'POST /api/v1/auth_professional' do
		it 'creates a user with a professional account and workplace' do
			professional = FactoryGirl.build(:professional)
			workplace = FactoryGirl.build(:workplace)

			params = {
				first_name: professional.first_name,
				last_name: professional.last_name,
				email: professional.email,
				password: professional.password,
				password_confirmation: professional.password,
				phone_number: professional.phone_number,
				bio: professional.bio,
				workplace_attributes: {
					name: workplace.name,
					address_1: workplace.address_1,
					address_2: workplace.address_2,
					city: workplace.city,
					zip: workplace.zip,
					state: workplace.state,
					country: workplace.country
				}
			}

			post '/api/v1/auth_professional', params

			expect(response).to be_success

			created_professional = Professional.find_by_email(professional.email)

			expect(created_professional.phone_number).to eq(professional.phone_number) 
			expect(created_professional.workplace.name).to eq(workplace.name)
		end
	end

	context 'GET /api/v1/professionals/:id' do
		it 'gets professional account' do
			professional = login_user('professional')

			get "/api/v1/professionals/#{professional.id}", nil, request_header

			expect(response).to be_success
			expect(professional.id).to eq(json['id']) 
		end
	end

	context 'PUT /api/v1/professionals/:id' do
		it 'updates professional account' do
			professional = login_user('professional')

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional: { phone_number: phone_number } }
			put "/api/v1/professionals/#{professional.id}", params, request_header
			#  needs to be authed
			expect(response).to be_success
			expect(json['phone_number']).to eq(phone_number)
		end

		it 'does not update professional account without request_header' do
			professional = login_user('professional')

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional: { phone_number: phone_number } }

			put "/api/v1/professionals/#{professional.id}", params
			#  needs to be authed
			expect(response).to_not be_success

			expect(json['errors']).to_not be_empty
		end

		it 'does not update a different professional account' do
			unlogged_professional = FactoryGirl.create(:professional)

			logged_professional = login_user('professional')

			phone_number = Faker::PhoneNumber.phone_number
			params = { professional: { phone_number: phone_number } }

			put "/api/v1/professionals/#{unlogged_professional.id}", params, request_header
			#  needs to be authed
			expect(response).to_not be_success

			expect(json['errors']).to_not be_empty
		end
	end	
end