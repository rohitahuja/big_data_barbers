class Schedule < ActiveRecord::Base
	belongs_to :professional_account
	has_many :appointments
	has_many :availabilities
end
