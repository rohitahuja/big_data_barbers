require 'rails_helper'

describe 'Session' do
  it 'logs the user in correctly' do
    user = FactoryGirl.create(:user)
    params = { email: user.email, password: user.password }

    post '/api/v1/sign_in', params

    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['email']).to eq(user.email) # check to make sure the right amount of messages are returned
  end
end