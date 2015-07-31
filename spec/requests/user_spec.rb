require 'rails_helper'

describe 'User' do
	context 'POST /api/v1/auth' do
		it 'creates a user with a professional account and workplace' do
			user = FactoryGirl.build(:user)
			professional_account = FactoryGirl.build(:professional_account)
			workplace = FactoryGirl.build(:workplace)

			params = {
				first_name: user.first_name,
				last_name: user.last_name,
				email: user.email,
				password: user.password,
				password_confirmation: user.password,
				professional_account_attributes: {
					phone_number: professional_account.phone_number,
					bio: professional_account.bio,
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
			}

			post '/api/v1/auth', params

			expect(response).to be_success

			created_user = User.find_by_email(user.email)

			expect(created_user.professional_account.phone_number).to eq(professional_account.phone_number) 
			expect(created_user.professional_account.workplace.name).to eq(workplace.name)
		end
	end	
end