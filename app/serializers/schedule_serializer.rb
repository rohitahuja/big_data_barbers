class ScheduleSerializer < ActiveModel::Serializer
  attributes :id
  has_many :availabilities, serializer: AvailabilitySerializer
  has_many :appointments, serializer: AppointmentSerializer
end
