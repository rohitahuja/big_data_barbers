Rails.application.routes.draw do
  devise_for :user, only: []

  mount_devise_token_auth_for 'User', at: 'api/v1/auth'

  namespace :api, defaults: { format: :json } do
    namespace :v1, shallow: true do
      resources :professional_accounts, only: [:show, :update] do
      	resources :schedules, only: [:show, :update]
      	resources :appointments, only: [:index, :show, :create, :update]
      	resources :posts, only: [:index, :show, :create] # add destroy later
      end
      # Add routes for things accessible to all users 
      # get :professional_accounts, on: collection
      # get :posts, on: :collection
    end
  end
  
end
