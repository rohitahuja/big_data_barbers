class ProfessionalAccount < ActiveRecord::Base

	belongs_to :user
	has_one :workplace
	has_one :schedule
	has_many :appointments, through: :schedule
	has_many :availabilities, through: :schedule
	accepts_nested_attributes_for :workplace

	validates :phone_number, presence: true

end
