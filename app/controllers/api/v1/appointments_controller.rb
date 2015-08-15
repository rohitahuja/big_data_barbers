# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class AppointmentsController < ApplicationController
	    before_action :authenticate_professional!, only: [:index, :show, :create, :update]

	    def index
	    	super
	    end

	    def show
	    	super
	    end

	    def create
	    	super
	    end

	    def update
	    	super
	    end

	    private

	      def appointment_params
					params.require(:appointment).permit(:status, :customer_name, :customer_phone_number, :date_and_time, :length, :schedule_id)
				end
	  end
	end
end