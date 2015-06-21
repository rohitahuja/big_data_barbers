require "rails_helper"

describe "creating professional accounts" do
	context "when users make an account for the first time" do
		it "creates a user account with a professional account and workplace" do
			visit "/users/sign_up"
			within("#new_user") do
				fill_in "first name", with: "Naaners"
				fill_in "last name", with: "Zaib"
				fill_in "email", with: "user@example.com"
				fill_in "password (8 characters minimum)", with: "12345678"
				fill_in "confirm password", with: "12345678"
				fill_in "phone number", with: "7325415978"
				fill_in "bio", with: "Hi, I'm a Nonner"
				fill_in "workplace name", with: "Quincy"
				fill_in "street", with: "16 Chauncy st"
				fill_in "city", with: "Cambridge"
				fill_in "zip", with: "02138"
				fill_in "state", with: "MA"
				fill_in "country", with: "USA"
			end
			click_button "Sign up"
			expect(User.last.professional_account).not_to be_nil
			expect(User.last.professional_account.phone_number).not_to be_empty
			expect(User.last.professional_account.workplace).not_to be_nil
			expect(User.last.professional_account.workplace.name).not_to be_empty
		end
	end
end