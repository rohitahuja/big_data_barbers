class PostPolicy < ApplicationPolicy

	class Scope < Scope
    def resolve
      scope.where(professional_account_id: user.professional_account.id)
    end
  end

	def create?
		user.professional_account != nil
	end

	def show?
    true
	end

  # def update?
  #   user.professional_account.schedule.id == record.schedule_id
  # end

  def destroy?
  	user.professional_account.id == record.professional_account_id
  end
  
end