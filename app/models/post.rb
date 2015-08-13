class Post < ActiveRecord::Base
	belongs_to :professional, inverse_of: :posts

	validates :image, :professional, presence: true

	mount_uploader :image, ImageUploader
end
