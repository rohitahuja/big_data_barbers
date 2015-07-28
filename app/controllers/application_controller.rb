class ApplicationController < ActionController::API
  include AbstractController::Translation
  include ActionController::Serialization
  # include ActionController::Parameters 
  # include ActionController::RequestForgeryProtection

  include DeviseTokenAuth::Concerns::SetUserByToken

  # protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

	protected

	  def configure_permitted_parameters
	  	devise_parameter_sanitizer.for(:sign_up).concat(
	  		[:first_name, :last_name, :email, :password, :password_confirmation, :professional, :customer,
	  		professional_account_attributes: [:phone_number, :bio, 
	        workplace_attributes: [:name, :address_1, :address_2, :city, :zip, :state, :country] ]])
	  	# devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
	  	# 	:first_name, :last_name, :email, :password, :password_confirmation) }
		end

end
