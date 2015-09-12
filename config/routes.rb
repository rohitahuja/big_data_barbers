Rails.application.routes.draw do
  ###
  # Documentation Route
  ###
  apipie

  ###
  # Devise Routes
  ###
  devise_for :professional, only: []
  # devise_for :shop, only: []
  mount_devise_token_auth_for 'Professional', at: 'api/v1/auth_professional'
  # mount_devise_token_auth_for 'Shop', at: 'api/v1/auth_shop'

  ###
  # API Routes
  ###
  namespace :api, defaults: { format: :json } do

    ###
    # V1 Routes
    ###
    namespace :v1, shallow: true do

      ###
      # Professional Routes
      ###
      # resource :professional, only: [] do
      #   get :schedule, on: :member
      #   get :appointments, on: :collection
      # end
      resources :professional_profiles, only: [:show, :update], path: '/professional/profiles'
      
      ###
      # Shop Routes
      ###
      # resource :shop, only: [] do
      #   get :professionals, on: :collection
      # end
      # resources :shop_profiles, only: [:show, :update], path: '/shop/profiles'

      ###
      # Additional Resource Routes
      ###
      # resources :appointments, only: [:show, :create, :update]
      # resources :schedules, only: [:update]
      resources :posts, only: [:index, :show, :create] # add destroy later
    end
  end
  
end
