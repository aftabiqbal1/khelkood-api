Rails.application.routes.draw do

  # devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  resources :customers do
    post :register_team, on: :collection
  end

  resources :teams do
    post :add_match_stats
  end

  resources :otp do
    get :verify, to: 'otp#verify', on: :collection
  end

  devise_scope :user do
    get 'verify_mobile_signin', to: 'users/sessions#verify_mobile_signin', as: :verify_mobile_signin
    get 'login', to: 'users/sessions#login'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'}

  # resources :users do
  #   get :signin, to: 'users#signin', on: :collection
  #   get :verify_mobile_signin, to: 'users#verify_mobile_signin', on: :collection
  # end
end
