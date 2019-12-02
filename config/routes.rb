Rails.application.routes.draw do

  root 'items#index'
  
  get 'credit_card/new'
  get 'credit_card/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    }

  resources :mypage, only: [:index, :update, :create] do
    collection do
      get :profile
      get :card
      get :identification
      get :logout
    end
  end

  resources :signup, only: [:show] do
    collection do
      get 'auth'
      get 'registlation'
      post 'sms_confirmation' do
        get 'sms' #電話認証のページ
      end
      post 'address'
      post 'payment'
      get 'done'
    end
  end

  resources :credit_card ,only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_category_size', defaults: { format: 'json' }
    end
  end

  resources :transactions, only: [:index, :show] do
    collection do
      get 'index', to: 'transactions#index'
      post 'index', to: 'transactions#create'
      post 'pay', to: 'transactions#pay'
      get 'done', to: 'transactions#done'
      get 'new', to: 'transactions#new'
    end
  end
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
