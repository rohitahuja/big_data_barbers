require 'rails_helper'
include RequestsHelper::SessionsHelper

describe 'Session' do
	context 'POST /api/v1/sign_in' do
		it 'signs in successfully' do
	    user = login_user

	    expect(response).to be_success
	    expect(json['email']).to eq(user.email) # check to make sure the right amount of messages are returned
	  end

	  it 'does not sign in with wrong credentials' do
	  	# will not create a user
	  	params = { email: Faker::Internet.email, password: Faker::Internet.password }

	  	post '/api/v1/sign_in', params

	  	expect(response).to_not be_success
	  	expect(json['message']).to_not be_empty
	  end
	end
  
  context 'DELETE /api/v1/sign_out' do
  	it 'signs out successfully' do
	  	user = login_user

	  	params = { email: user.email, access_token: user.access_token }
	  	post '/api/v1/sign_out', params

	  	expect(response).to be_success
	  end

	  it 'does not sign out when not initially signed in' do
	  	user = FactoryGirl.create(:user)

	  	params = { email: user.email, access_token: user.access_token }
	  	post '/api/v1/sign_out', params

	  	expect(response).to_not be_success
	  	expect(json['message']).to_not be_empty
	  end
  end
  
end