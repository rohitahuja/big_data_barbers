class AppointmentPolicy < ApplicationPolicy

	def create?
		user.professional_account.id == record.professional_account_id
	end

	# def show?
	# 	user.professional_account.schedule.id == record.schedule_id
	# end

  # def update?
  #   user.professional_account.schedule.id == record.schedule_id
  # end

  def destroy?
  	user.professional_account.id == record.professional_account_id
  end
  
end