# app/controllers/v1/professionals_controller.rb
module Api
	module V1
	  class ProfessionalsController < Api::V1::BaseController
	    before_action :authenticate_professional!, only: [:update] #:create, :destroy

	    def_param_group :professional do
			  param :professional, Hash, 'Professional Information', required: true, action_aware: true do
			  	param :first_name, String, 'First name of the Professional', required: true
			  	param :last_name, String, 'Last name of the Professional', required: true
			  	param :phone_number, String, 'Phone number of the Professional', required: true
			  	param :bio, String, 'Bio of the Professional', required: true
			  	param :profile_image, String, 'Image encoded in Base64', required: true
			  end
			end

	    api :GET, '/professionals/:id', "Fetch a single Professional"
			param :id, :number, desc: "Professional ID", required: true
	    def show
	    	super
	    end

	    api :PUT, '/professionals/:id', "Update a Professional"
	    param_group :header, Api::V1::BaseController
			param :id, :number, desc: "Professional ID", required: true
			param_group :professional, desc: 'Professional Information'
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