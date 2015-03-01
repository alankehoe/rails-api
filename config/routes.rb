require 'sidekiq/web'
require 'sidetiq/web'

Rails.application.routes.draw do
  #
  # Active Admin & Devise
  #
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes self

  #
  # Sidekiq
  #
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/monitoring/sidekiq'
  end

  #
  # Doorkeeper for OAuth 2
  #
  use_doorkeeper

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
