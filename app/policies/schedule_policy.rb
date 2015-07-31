class SchedulePolicy < ApplicationPolicy

  def update?
    user.professional_account.id == record.professional_account_id
  end

  # def destroy?
  # 	user.professional_account.id == record.professional_account_id
  # end
  
end