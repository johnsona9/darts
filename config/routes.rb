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

  get '/log_in_one', to: 'sessions#new_one'
  post 'log_in_one', to: 'sessions#create_one'
  delete '/log_out_one', to: 'sessions#destroy_one'

  get '/log_in_two', to: 'sessions#new_two'
  post 'log_in_two', to: 'sessions#create_two'
  delete '/log_out_two', to: 'sessions#destroy_two'

  get '/log_in_three', to: 'sessions#new_three'
  post 'log_in_three', to: 'sessions#create_three'
  delete '/log_out_three', to: 'sessions#destroy_three'

  get '/log_in_four', to: 'sessions#new_four'
  post 'log_in_four', to: 'sessions#create_four'
  delete '/log_out_four', to: 'sessions#destroy_four'

  post 'cricket_games/update_player'

end
