Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get '/new_game', to: 'games#new'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  resources :cricket_games
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  get '/log_in', to: 'sessions#new'
  post 'log_in', to: 'sessions#create'
  delete '/log_out', to: 'sessions#destroy'

  post 'cricket_games/update_player'

end
