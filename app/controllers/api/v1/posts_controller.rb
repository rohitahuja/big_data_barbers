# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class PostsController < ApplicationController
	    before_action :authenticate_professional!, only: [:create, :destroy]

	    def index
	    	super
	    end

	    def show
	    	super
	    end

	    def create
	    	super
	    end

	    private

	      def post_params
	      	# return @params if they've been processed
	      	return @params if @params

			    # save params through strong params
			    @params = params.require(:post).permit(:image, :professional_id)

			    # process params if necessary
			    @params[:image] = decode_image_data(@params[:image]) if @params[:image]

			    # return @params
			    @params
				end
	  end
	end
end