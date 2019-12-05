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
      get :like
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

  resources :credit_card ,only: [:new] do
    collection do
      post 'pay', to: 'credit_card#pay'
      delete 'delete', to: 'credit_card#delete'
    end
  end

  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_category_size', defaults: { format: 'json' }
    end
    resources :likes, only: [:create, :destroy]
  end

  resources :transactions, only: [:show] do
    collection do
      get 'pay', to: 'transactions#pay'
      get 'done', to: 'transactions#done'
    end
  end

  post   '/like/:item_id', to: 'likes#create', as: :like
  delete '/like/:item_id', to: 'likes#destroy', as: :unlike
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
