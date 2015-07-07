class AppointmentsController < ApplicationController
  def new
  	@appointment = Appointment.new
  end

  def create
  	@appointment = current_user.schedule.appointments.create(appointment_params)
  	redirect_to @appointment
  end

  def show
  	@appointment = Appointment.find(params[:id])
  end

protected

	def appointment_params
		params.require(:appointment).permit(:customer_name, :customer_phone_number, :date_and_time, :length)
	end
end
