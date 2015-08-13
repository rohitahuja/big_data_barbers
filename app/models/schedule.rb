class Schedule < ActiveRecord::Base
	belongs_to :professional, inverse_of: :schedule
	has_many :appointments, inverse_of: :schedule
	has_many :availabilities, inverse_of: :schedule

	validates :professional, presence: true # validation needs to be one way

	accepts_nested_attributes_for :availabilities, allow_destroy: true
end
