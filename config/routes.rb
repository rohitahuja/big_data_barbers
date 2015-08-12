Rails.application.routes.draw do
  devise_for :professional, only: []

  mount_devise_token_auth_for 'Professional', at: 'api/v1/auth_professional'

  namespace :api, defaults: { format: :json } do
    namespace :v1, shallow: true do
      resources :professionals, only: [:show, :update] do
      	resources :schedules, only: [:show, :update]
      	resources :appointments, only: [:index, :show, :create, :update]
      	resources :posts, only: [:index, :show, :create] # add destroy later
      end
      # Add routes for things accessible to all users 
      # get :professionals, on: collection
      # get :posts, on: :collection
    end
  end
  
end
