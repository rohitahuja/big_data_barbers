class SchedulesController < ApplicationController
  def edit
  	@schedule = Schedule.find(params[:id])
  end

  def update
  	@schedule = Schedule.find(params[:id])
  	@schedule.update!(schedule_params)
  	redirect_to @schedule
  end

  def show
  	@schedule = Schedule.find(params[:id])
  end

protected

	def schedule_params
		params.require(:schedule).permit(availabilities_attributes: [:id, :day_of_week, :start_time, :end_time, :_destroy])
	end

end
