Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'

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
  
end
