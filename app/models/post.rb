class Post < ActiveRecord::Base
	belongs_to :professional

	mount_uploader :image, ImageUploader
end
