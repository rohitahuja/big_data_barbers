class ProfessionalPolicy < ApplicationPolicy

  def update?
    user.id == record.id
  end
  
end