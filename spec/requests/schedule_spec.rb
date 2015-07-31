require 'rails_helper'

describe 'Schedule' do
	context 'GET /api/v1/auth/professional_accounts/:professional_account_id/schedule' do
		it 'signs in successfully' do
	    user = login_user

	    expect(response).to be_success
	    expect(json['data']['email']).to eq(user.email) # check to make sure the right amount of messages are returned
	  end

	  it 'does not sign in with wrong credentials' do
	  	# will not create a user
	  	params = { email: Faker::Internet.email, password: Faker::Internet.password }

	  	post '/api/v1/auth/sign_in', params
	  	expect(response).to_not be_success
	  	expect(json['errors']).to_not be_empty
	  end
	end
  
  context 'DELETE /api/v1/auth/sign_out' do
  	it 'signs out successfully' do
	  	user = login_user

	  	delete '/api/v1/auth/sign_out', nil, request_header
	  	expect(response).to be_success
	  end

	  it 'does not sign out when not initially signed in' do
	  	user = FactoryGirl.create(:user)

	  	delete '/api/v1/auth/sign_out'
	  	expect(response).to_not be_success
	  	expect(json['errors']).to_not be_empty
	  end
  end
  
end