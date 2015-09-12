class PostPolicy < ApplicationPolicy

	class Scope < Scope
    def resolve
      if user.professional?
        scope.order(:created_at).where(professional_profile_id: user.profile.id)
      # elsif user.shop?
      #   scope.order(:created_at).joins(professional_profiles: [{ professionals: :shops }]).where(shops: { id: user.id })
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