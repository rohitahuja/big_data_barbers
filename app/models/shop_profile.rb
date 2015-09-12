class ShopProfile < ActiveRecord::Base
	belongs_to :shop, inverse_of: :shop_profile

	validates :name, :address_1, :address_2, :city, :state, :country, :zip, presence: true
	has_many :professional_profile, inverse_of: :shop_profile
	has_many :posts, through: :professional_profile
	# add uniqueness validations for this
	# add validations that ensure address is valid
end
