class ApplicationController < ActionController::API

  include AbstractController::Translation
  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json

end
