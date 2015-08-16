# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class AppointmentsController < Api::V1::BaseController
	    before_action :authenticate_professional!, only: [:index, :show, :create, :update]

	    def_param_group :appointment do
			  param :appointment, Hash, 'Appointment Information', required: true, action_aware: true do
			  	param :status, Integer, 'Status of the Appointment { -1 => rejected, 0 => pending, 1 => accepted }', required: true
			  	param :date_and_time, String, 'Date and time of appointment', required: true
			  	param :length, Integer, 'Length of the appointment', required: true
			  	param :customer_name, String, 'Name of the customer', required: true
			  	param :customer_phone_number, String, 'Phone number of the customer', required: true
			  end
			end

	    api :GET, '/professionals/:id/appointments', 'Fetch all Appointments under a Professional'
	    param_group :header, Api::V1::BaseController
			param :id, :number, desc: "Professional ID", required: true
	    def index
	    	super
	    end

	    api :GET, '/appointments/:id', 'Fetch a single Appointment'
	    param_group :header, Api::V1::BaseController
	    param :id, :number, desc: "Appointment ID", required: true
	    def show
	    	super
	    end

	    api :POST, '/professionals/:id/appointments', 'Create an Appointment'
	    param_group :header, Api::V1::BaseController
	    param :id, :number, desc: "Professional ID", required: true
	    param_group :appointment
	    def create
	    	super
	    end

	    api :PUT, '/appointments/:id', 'Update an Appointment'
	    param_group :header, Api::V1::BaseController
	    param :id, :number, desc: "Appointment ID", required: true
	    param_group :appointment
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