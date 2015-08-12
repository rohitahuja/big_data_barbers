class Post < ActiveRecord::Base
	belongs_to :professional_account

	mount_uploader :image, ImageUploader
end
