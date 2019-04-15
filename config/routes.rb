Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :vehicles, only: [:show] do
    member do
      get :doors
      get :fuel
      get :battery
      post :engine
    end
  end

  root to: 'vehicles#home'
end
