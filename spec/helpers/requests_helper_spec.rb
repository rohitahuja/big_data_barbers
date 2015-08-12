module RequestsHelper
	module JsonHelper
		def json
			@json ||= JSON.parse(response.body)
		end
	end

	module SessionsHelper
		def login_user(type)
			user = FactoryGirl.create(type.to_sym)
			params = { email: user.email, password: user.password }
			post '/api/v1/auth_' + type + '/sign_in', params
			user
		end

		def request_header
			header = response.header
			{ 'uid' => header['uid'], 
				'access-token' => header['access-token'], 
				'client' => header['client'] }
		end

		# def create_params(object)
		# 	params = {}
		# 	object.attributes.each do |attr_name, attr_value|
		# 		if attr_value.is_a?(ActiveRecord::Base)
		# 			params[attr_name + '_attributes'] => create_params(attr_value)
		# 		end
		# 		params[attr_name]
		# 	end
		# 	{ 
		# 		object.class.name.downcase => 
		# 	}
		# end
	end
end