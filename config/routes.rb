Rails.application.routes.draw do

  
  root 'welcome#index'
  devise_for :users
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
