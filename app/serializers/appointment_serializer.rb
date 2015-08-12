class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :status, :date_and_time, :length, :customer_name, :customer_phone_number
end
