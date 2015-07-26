module RequestsHelper
	module JsonHelper
		def json
			@json ||= JSON.parse(response.body)
		end
	end

	module SessionsHelper
		def login_user
			user = FactoryGirl.create(:user)
			params = { email: user.email, password: user.password }
			post '/api/v1/sign_in', params
			user
		end
	end
end