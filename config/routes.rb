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
  resources :mypages, only: [:index, :update] do
    collection do
      get :profile
      get :card
      get :identification
    end
  end
  get 'itmes/index'
  resources :signup do
    collection do
      get 'registlation'
      get 'sms_confirmation' do
        get 'sms' #電話認証のページ
      end
      get 'address'
      get 'payment' 
      get 'done' 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
