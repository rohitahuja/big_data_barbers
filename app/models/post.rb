class Post < ActiveRecord::Base
	belongs_to :professional_account
	attachment :profile_image
end
