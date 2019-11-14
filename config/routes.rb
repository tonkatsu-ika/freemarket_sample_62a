Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations' 
  }
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
