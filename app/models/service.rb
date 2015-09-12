class Service < ActiveRecord::Base
	has_many :service_details, inverse_of: :service
	has_many :professionals, through: :service_details
	has_many :shops, through: :service_details
	has_many :posts, inverse_of: :service
end
