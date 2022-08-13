Rails.application.routes.draw do
  get 'home/index'
  # devise_for :users
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  # mount_devise_token_auth_for 'User', at: 'auth'
  # mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?


  root to: 'home#index'

  resources :customers do
    post :register_team, on: :collection
  end

  resources :sports_complex do
    post :post_review
  end

  resources :teams do
    post :add_match_stats
  end

  resources :otp do
    get :verify, to: 'otp#verify', on: :collection
  end

  resources :users do
    get :signin, to: 'users#signin', on: :collection
    get :verify_mobile_signin, to: 'users#verify_mobile_signin', on: :collection
  end
end
