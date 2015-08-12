class AppointmentPolicy < ApplicationPolicy

	class Scope < Scope
    def resolve
      if user.professional?
        scope.where(schedule_id: user.schedule.id)
      end
    end
  end

	def create?
		user != nil
	end

	def show?
    if user.professional?
      user.schedule.id == record.schedule_id  
    end
	end

  def update?
    if user.professional?
      user.schedule.id == record.schedule_id  
    end
  end

  def destroy?
    if user.professional?
      user.schedule.id == record.schedule_id  
    end
  end
  
end