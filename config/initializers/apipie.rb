Apipie.configure do |config|
  config.app_name                = "BigDataBarbers"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"

  # config.authenticate = Proc.new do
  #    authenticate_or_request_with_http_basic do |username, password|
  #      username == "test" && password == "supersecretpassword"
  #   end
  # end
end
