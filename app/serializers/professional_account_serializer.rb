class ProfessionalAccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :bio, :workplace, :schedule_id

  def name
  	object.user.name
  end

  def workplace
  	Workplace.where(id: object.workplace_id).select([:name, :address_1, :address_2, :city, :zip, :country]).first
  end

  def schedule_id
  	Schedule.find_by_professional_account_id(object.id).id
  end


end
