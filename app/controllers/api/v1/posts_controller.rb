# app/controllers/v1/appointments_controller.rb
module Api
	module V1
	  class PostsController < ApplicationController
	    before_action :authenticate_user!, only: [:create, :destroy]

	    private

	      def post_params
					params.require(:post).permit(:image)
				end
	  end
	end
end