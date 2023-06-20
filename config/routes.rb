Rails.application.routes.draw do

  # ユーザ用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #ゲスト用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # アドミン用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do

    root to: 'homes#top'
    get '/about' => 'homes#about'
    get 'search' => 'searches#search'
    get '/mypage' => 'users#mypage'

    resources :users, only: [:index, :show, :edit, :update] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :posts do
      get :favorites, on: :collection
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :comments, only: [:destroy]
  end

  namespace :admin do

    root to: 'posts#index'
    get 'search' => 'searches#search'
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:show, :destroy]
    resources :comments, only: [:destroy]
  end

end