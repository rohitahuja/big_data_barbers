class ProfessionalAccount < ActiveRecord::Base

	belongs_to :user
	belongs_to :workplace
	has_one :schedule
	has_many :appointments, through: :schedule
	has_many :availabilities, through: :schedule
	has_many :posts
	accepts_nested_attributes_for :workplace #, reject if: workplace_exists?

	validates :phone_number, presence: true #needs to be unique

	mount_uploader :profile_image, ImageUploader

	# Create a schedule object for a professional account once it has been created
	after_create do |professional_account|
		professional_account.create_schedule
		user = professional_account.user
		user.is_professional = true
		user.save
	end

end
