# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class AppointmentsController < ApplicationController
	    before_action :authenticate_user!, only: [:index, :show, :create, :update]

	    private

	      def appointment_params
					params.require(:appointment).permit(:customer_name, :customer_phone_number, :date_and_time, :length)
				end
	  end
	end
end