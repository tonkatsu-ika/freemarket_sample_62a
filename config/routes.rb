Rails.application.routes.draw do
  root 'items#index'
  resources :mypages, only: [:index, :update] do
    collection do
      get :profile
      get :card
      get :identification
    end
  end
  get 'itmes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
