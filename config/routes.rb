Rails.application.routes.draw do
  get 'home/index'
  # devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'home#index'

  resources :customers
  post 'customers/registerTeam'

  resources :sports_complex
  post 'sports_complex/postReview'

  resources :teams
  post 'teams/add_match_stats'
end
