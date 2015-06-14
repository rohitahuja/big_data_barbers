require 'rails_helper'

describe 'creating professional accounts' do
	context 'when users make an account for the first time' do
		it 'creates a user account with a professional account and workplace' do
			visit '/users/sign_up'
			within('#new_user') do
				fill_in 'First name', with: 'Naaners'
				fill_in 'Last name', with: 'Zaib'
				fill_in 'Email', with: 'user@example.com'
				fill_in 'Password', with: '12345678'
				fill_in 'Password confirmation', with: '12345678'
				fill_in 'Phone number', with: '7325415978'
				fill_in 'Bio', with: "Hi, I'm a Nonner"
				fill_in 'Name', with: "16 Chauncy st."
			end
			click_button 'Sign up'
			expect(User.last.professional_account).not_to be_nil
			expect(User.last.professional_account.phone_number).not_to be_empty
			expect(User.last.professional_account.workplace).not_to be_nil
			expect(User.last.professional_account.workplace.name).not_to be_empty
		end
	end
end