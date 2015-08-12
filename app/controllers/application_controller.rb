class ApplicationController < ActionController::API
  include AbstractController::Translation
  include ActionController::Serialization
  # include ActionController::Parameters 
  include ActionController::RequestForgeryProtection
  include ActionController::ImplicitRender

  include DeviseTokenAuth::Concerns::SetUserByToken

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :null_session
  # serialization_scope :view_context
  before_action :set_resource, only: [:destroy, :show, :update], unless: :devise_controller?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

	# POST /api/v1/{plural_resource_name}
	def create  
	  set_resource(resource_class_name.new(resource_params))

    authorize get_resource

	  if get_resource.save
	    # render :show, status: :created
      render json: get_resource, serializer: serializer_name, status: :created
	  else
	    render json: get_resource.errors, status: :unprocessable_entity
	  end
	end

	# DELETE /api/v1/{plural_resource_name}/1
	def destroy
    authorize get_resource

	  get_resource.destroy
	  head :no_content
	end

	# GET /api/v1/{plural_resource_name}
	def index
	  plural_resource_name = "@#{resource_name.pluralize}"
	  resources = policy_scope(resource_class_name) ||
                resource_class_name.where(query_params)
	                            # .page(page_params[:page])
	                            # .per(page_params[:page_size])

	  instance_variable_set(plural_resource_name, resources)
	  respond_with instance_variable_get(plural_resource_name), each_serializer: serializer_name
	end

	# GET /api/v1/{plural_resource_name}/1
	def show
    authorize get_resource

	  respond_with get_resource, serializer: serializer_name
	end

	# PATCH/PUT /api/v1/{plural_resource_name}/1
	def update  
    authorize get_resource

	  if get_resource.update(resource_params)
      # render :show
	    render json: get_resource, serializer: serializer_name
	  else
	    render json: get_resource.errors, status: :unprocessable_entity
	  end
	end

  def current_user
    current_professional # || current_customer || current_shop
  end

  private
    # Returns the resource from the created instance variable
    # @return [Object]
    def get_resource
      instance_variable_get("@#{resource_name}")
    end

    # Returns the allowed parameters for searching
    # Override this method in each API controller
    # to permit additional parameters to search on
    # @return [Hash]
    def query_params
      {}
    end

    # Returns the allowed parameters for pagination
    # @return [Hash]
    # def page_params
    #   params.permit(:page, :page_size)
    # end

    # The resource class based on the controller
    # @return [Class]
    def resource_class_name
      @resource_class_name ||= resource_name.classify.constantize
    end

    def serializer_name
      (resource_name.classify + 'Serializer').constantize
    end

    # The singular name for the resource class based on the controller
    # @return [String]
    def resource_name
      @resource_name ||= self.controller_name.singularize
    end

    # Only allow a trusted parameter "white list" through.
    # If a single resource is loaded for #create or #update,
    # then the controller for the resource must implement
    # the method "#{resource_name}_params" to limit permitted
    # parameters for the individual model.
    def resource_params
      @resource_params ||= self.send("#{resource_name}_params")
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_resource(resource = nil)
      resource ||= resource_class_name.find(params[:id])
      instance_variable_set("@#{resource_name}", resource)
    end

    def user_not_authorized
      render json: { errors: [ 'Your are not authorized to perform this action.' ] }, status: :unauthorized
    end

	protected

	  def configure_permitted_parameters
	  	devise_parameter_sanitizer.for(:sign_up).concat(
	  		[:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :bio, 
	        workplace_attributes: [:name, :address_1, :address_2, :city, :zip, :state, :country]])
      devise_parameter_sanitizer.for(:account_update).concat(
        [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :bio, 
          workplace_attributes: [:name, :address_1, :address_2, :city, :zip, :state, :country]])
	  	# devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
	  	# 	:first_name, :last_name, :email, :password, :password_confirmation) }
		end

end
