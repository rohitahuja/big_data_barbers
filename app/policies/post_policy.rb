class PostPolicy < ApplicationPolicy

	class Scope < Scope
    def resolve
      if user.professional?
        scope.where(professional_id: user.id)
      end
    end
  end

	def create?
		user != nil
	end

	def show?
    true
	end

  # def update?
  #   user.schedule.id == record.schedule_id
  # end

  def destroy?
    if user.professional?
      user.id == record.professional_id 
    end
  end
  
end