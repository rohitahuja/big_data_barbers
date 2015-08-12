class SchedulePolicy < ApplicationPolicy

  def update?
  	if user.professional?
      user.id == record.professional_id 
    end
  end

  # def destroy?
  # 	user.id == record.professional_account_id
  # end
  
end