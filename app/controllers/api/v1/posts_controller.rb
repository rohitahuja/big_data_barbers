# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class PostsController < Api::V1::BaseController
	    before_action :authenticate_professional!, only: [:create, :destroy]

	    def_param_group :post do
			  param :post, Hash, 'Post Information', required: true, action_aware: true do
			  	param :image, String, 'Image encoded in Base64', required: true
			  end
			end

			api :GET, '/professionals/:id/posts', 'Fetch all Posts under a Professional'
	    param_group :header, Api::V1::BaseController
			param :id, :number, desc: "Professional ID", required: true
	    def index
	    	super
	    end

	    api :GET, '/posts/:id', 'Fetch a single Post'
			param :id, :number, desc: "Professional ID", required: true
	    def show
	    	super
	    end

	    api :POST, '/professionals/:id/posts', 'Creates a Post under a Professional'
	    param_group :header, Api::V1::BaseController
			param :id, :number, desc: "Professional ID", required: true
			param_group :post
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