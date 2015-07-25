Rails.application.routes.draw do
  devise_for :user, only: []

  scope :api, defaults: { format: :json } do
    namespace :v1 do
      resource :sign_in, only: [:create], controller: :sessions
    end
  end
  
end
