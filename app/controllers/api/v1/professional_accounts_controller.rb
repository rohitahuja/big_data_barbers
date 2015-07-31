# app/controllers/v1/professional_account_controller.rb
module Api
	module V1
	  class ProfessionalAccountsController < ApplicationController
	    before_action :authenticate_user!, only: [:create, :destroy, :update]

	    private

	      def professional_account_params
	        params.require(:professional_account).permit(:bio, :phone_number)
	      end

	      # query params used for searching

	  end
	end
end