# app/controllers/v1/professionals_controller.rb
module Api
	module V1
	  class ProfessionalsController < ApplicationController
	    before_action :authenticate_professional!, only: [:update] #:create, :destroy, 

	    private

				def professional_params
	        params.require(:professional).permit(:bio, :phone_number, 
	        workplace_attributes: [:name, :address_1, :address_2, :city, :zip, :state, :country])
	      end
	  end
	end
end