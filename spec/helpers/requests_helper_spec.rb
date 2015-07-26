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
			post '/api/v1/auth/sign_in', params
			user
		end

		def request_header
			header = response.header
			{ 'uid' => header['uid'], 
				'access-token' => header['access-token'], 
				'client' => header['client'] }
		end
	end
end