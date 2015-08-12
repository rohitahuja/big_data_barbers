# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class PostsController < ApplicationController
	    before_action :authenticate_user!, only: [:create, :destroy]

	    private

	      def post_params
	      	# return @params if they've been processed
	      	return @params if @params

			    # process through strong params
			    @params = params.require(:post).permit(:image, :professional_account_id)
			    @params[:image] = decode_image_data(@params[:image])

			    # return @params
			    @params
				end
	  		
	  		def decode_image_data image_data
			    # decode the base64
			    data = StringIO.new(Base64.decode64(image_data))

			    # assign some attributes for carrierwave processing
			    data.class.class_eval { attr_accessor :original_filename, :content_type }
			    data.original_filename = "upload.png"
			    data.content_type = "image/png"

			    # return decoded data
			    data
				end
	  end
	end
end