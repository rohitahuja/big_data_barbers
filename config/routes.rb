Rails.application.routes.draw do
  devise_for :user, only: []

  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :professional_accounts, only: [:show, :update] do
      	resources :schedule, only: [:show, :update], shallow: true
      	resources :appointments, only: [:index, :show, :create, :update], shallow: true
      	resources :post, only: [:index, :show, :create, :destroy], shallow: true
      end
    end
  end
  
end
