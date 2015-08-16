# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class BaseController < ApplicationController
	  	def_param_group :header do
			  header 'uid', 'Email of signed in user', required: true
			  header 'access-token', 'Access-token received from last request', required: true
			  header 'client', 'Client ID received from signing in', required: true
			end
	  end
	end
end