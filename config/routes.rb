Rails.application.routes.draw do
  devise_for :user, only: []

  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  scope :api, defaults: { format: :json } do
    namespace :v1 do
      resources :professional_accounts, only: [:show, :update]
    end
  end
  
end
