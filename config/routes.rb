Rails.application.routes.draw do
  get 'credit_card/new'
  get 'credit_card/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations' 
    }
  root 'items#index'
  resources :mypage, only: [:index, :update] do
    collection do
      get :profile
      get :card
      get :identification
      get :logout
    end
  end


  resources :signup do
    collection do
      get 'registlation'
      get 'sms_confirmation' do
        get 'sms' #電話認証のページ
      end
      get 'address'
      post 'payment' 
      post 'done' 
    end
  end


  resources :items
  resources :users, only: :show
  resources :transactions, only: [:new, :create]
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
