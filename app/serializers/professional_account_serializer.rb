class ProfessionalAccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :bio

  def name
  	object.user.name
  end


end
