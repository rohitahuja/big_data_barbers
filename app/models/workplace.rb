class Workplace < ActiveRecord::Base
	belongs_to :professional_account

	validates :name, :address_1, :address_2, :city, :state, :country, presence: true
	# validates :zip, presence: true, numericality: { only_integer: true }
	# add uniqueness validations for this
	has_many :professional_accounts
end
