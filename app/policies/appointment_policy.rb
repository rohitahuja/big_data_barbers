class AppointmentPolicy < ApplicationPolicy

	class Scope < Scope
    def resolve
      scope.where(schedule_id: user.professional_account.schedule.id)
    end
  end

	def create?
		user.professional_account != nil
	end

	def show?
		user.professional_account.schedule.id == record.schedule_id
	end

  def update?
    user.professional_account.schedule.id == record.schedule_id
  end

  def destroy?
  	user.professional_account.schedule.id == record.schedule_id
  end
  
end