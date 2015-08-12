class WorkplaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :zip, :state, :country
end
