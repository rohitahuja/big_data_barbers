# app/controllers/v1/professional_accounts_controller.rb
module Api
	module V1
	  class ProfessionalAccountsController < ApplicationController
	    before_action :authenticate_user!, only: [:update] #:create, :destroy, 

	    private

				def professional_account_params
	        params.require(:professional_account).permit(:bio, :phone_number)
	      end
	  end
	end
end