class Workplace < ActiveRecord::Base
	validates :name, :address_1, :address_2, :city, :state, :country, :zip, presence: true
	# add uniqueness validations for this
	# add validations that ensure address is valid
	has_many :professionals, inverse_of: :workplace
end
