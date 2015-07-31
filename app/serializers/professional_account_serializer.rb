class ProfessionalAccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :bio, :workplace

  def name
  	object.user.name
  end

  def workplace
  	Workplace.where(id: object.workplace_id).pluck(:name, :address_1, :address_2, :city, :zip, :country).first
  end


end
