class ProfessionalAccount < ActiveRecord::Base

	belongs_to :user
	has_one :workplace
	accepts_nested_attributes_for :workplace

end
