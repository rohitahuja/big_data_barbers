# app/controllers/v1/schedules_controller.rb
module Api
	module V1
	  class SchedulesController < Api::V1::BaseController
	    before_action :authenticate_professional!, only: [:update]

	  #   def_param_group :availability do
			#   param :id, Integer, 'Availability ID', required: true
			#   param :day_of_week, String, 'Day of the week { 0 => Sunday, 1 => Monday, ..., 6 => Saturday }', required: true
			#   param :start_time, String, 'Start time of the availability', required: true
			#   param :end_time, String, 'End time of the availability', required: true
			#   param :_destroy, Integer, 'Check to delete availability { 0 => do not delete, 1 => delete }', required: true
			# end

	    def_param_group :schedule do
			  param :schedule, Hash, 'Schedule Information', required: true do
			  	param :availabilities_attributes, Array, 'Availabilities collection', required: true do
			  		# param_group :availability
			  		param '0'.to_sym, Hash do
			  			param :id, Integer, 'Availability ID', required: true
						  param :day_of_week, String, 'Day of the week { 0 => Sunday, 1 => Monday, ..., 6 => Saturday }', required: true
						  param :start_time, String, 'Start time of the availability', required: true
						  param :end_time, String, 'End time of the availability', required: true
						  param :_destroy, Integer, 'Check to delete availability { 0 => do not delete, 1 => delete }', required: true	
			  		end
			  	end
			  end
			end

			api :GET, '/schedules/:id', "Fetch the Professional's Schedule"
			param_group :header, Api::V1::BaseController
			param :id, :number, desc: "Schedule ID", required: true
	    def show
	    	super
	    end

	    api :PUT, '/schedules/:id', 'Update a schedule'
	    param_group :header, Api::V1::BaseController
	    param :id, :number, desc: "Schedule ID", required: true
	    param_group :schedule
	    def update
	    	super
	    end

	    private

	      def schedule_params
					params.require(:schedule).permit(availabilities_attributes: [:id, :day_of_week, :start_time, :end_time, :_destroy])
				end
	  end
	end
end