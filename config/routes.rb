# frozen_string_literal: true

# require 'sidekiq/web'
# require 'sidekiq-scheduler/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get '*path', to: "application#fallback_index_html", constraints: ->(request) do
  #   !request.xhr? && request.format.html?
  # end
  # namespace :api, defaults: { format: :json } do
  #   resources :users, only: %w[show]
  # end

  root 'welcome#index'
  devise_for :users,
   defaults:{format: :json},
  #  path: '',
  #  path_names:{
  #   sign_in: 'api/login',
  #   sign_out: 'api/logout',
  #   registration: 'api/signup'
  #  },
   controllers: { 
     registrations: 'registrations', 
     sessions: 'sessions'
     }
  get '/member-data', to: 'members#show'
  resources :users do
    resources :gifts do
      member do
        put 'toggle_selected', as: :select
      end
      resource :images, only: %i[create destroy]
    end
    resource :estimates, only: %i[create destroy]
    resource :reviews, only: %i[create destroy]
  end
  resources :invitations, only: %i[index create destroy]
end
