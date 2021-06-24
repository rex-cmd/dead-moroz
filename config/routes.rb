Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'

  resources :users do
       resources :gifts do
            resource :images, only: %i[create destroy]
       end
       resource :reviews, only: %i[create destroy]
  end
  
end
