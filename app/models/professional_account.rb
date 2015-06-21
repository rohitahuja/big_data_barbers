class ProfessionalAccount < ActiveRecord::Base

	belongs_to :user
	has_one :workplace
	accepts_nested_attributes_for :workplace

	validates :phone_number, presence: true

end
