# app/controllers/v1/professionals_controller.rb
module Api
	module V1
	  class ProfessionalsController < ApplicationController
	    before_action :authenticate_professional!, only: [:update] #:create, :destroy

	    def show
	    	super
	    end

	    def update
	    	super
	    end

	    private

				def professional_params
					# return @params if they've been processed
	      	return @params if @params

			    # save params through strong params
			    @params = params.require(:professional).permit(:bio, :phone_number, :profile_image, 
	        					workplace_attributes: [:name, :address_1, :address_2, :city, :zip, :state, :country])

			    # process params if necessary
			    @params[:profile_image] = decode_image_data(@params[:profile_image]) if @params[:profile_image]

			    # return @params
			    @params
	      end
	  end
	end
end