class Schedule < ActiveRecord::Base
	belongs_to :professional_account
	has_many :appointments
	has_many :availabilities

	accepts_nested_attributes_for :availabilities, allow_destroy: true
end
