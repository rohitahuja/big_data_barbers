class ProfessionalProfile < ActiveRecord::Base
	belongs_to :professional, inverse_of: :professional_profile
	has_many :posts, inverse_of: :professional_profile
end
