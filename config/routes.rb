Rails.application.routes.draw do
  root 'items#index'
  resources :mypage, only: [:index, :update] do
    collection do
      get :profile
      get :card
      get :identification
      get :logout
    end
  end
  resources :items
  resources :users, only: :show
  resources :transactions, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
