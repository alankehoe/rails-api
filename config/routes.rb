require 'sidekiq/web'
require 'sidetiq/web'

Rails.application.routes.draw do
  #
  # Active Admin & Sidekiq
  #
  devise_for :users, ActiveAdmin::Devise.config
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/monitoring/sidekiq'
  end
  ActiveAdmin.routes(self)
  
  #
  # Doorkeeper for OAuth 2
  #
  use_doorkeeper { skip_controllers :authorizations, :authorized_applications }

  #
  # Api Resources
  #
  namespace :api do
    namespace :v1 do
      get '/me', to: 'me#index'
      put '/me', to: 'me#update'
      put '/me/password', to: 'me#password'
      put '/me/avatar', to: 'me#avatar'

      resources :users
      resources :groups
    end
  end
end
