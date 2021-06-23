Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'welcome#index'

  resources :users do
       resources :gifts do
            resource :images, only: %i[create destroy]
       end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
