# app/controllers/v1/schedules_controller.rb
module Api
	module V1
	  class SchedulesController < ApplicationController
	    before_action :authenticate_professional!, only: [:update]

	    def show
	    	super
	    end

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