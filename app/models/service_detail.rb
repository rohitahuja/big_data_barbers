class ServiceDetail < ActiveRecord::Base
	belongs_to :service, inverse_of :service_details
	belongs_to :professional, inverse_of :service_details
	belongs_to :shop, inverse_of :service_details
end
