Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get '/new_game', to: 'games#new'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  resources :games
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  get '/log_in_one', to: 'sessions#new_one'
  post 'log_in_one', to: 'sessions#create_one'
  delete '/log_out_one', to: 'sessions#destroy_one'

  get '/log_in_two', to: 'sessions#new_two'
  post 'log_in_two', to: 'sessions#create_two'
  delete '/log_out_two', to: 'sessions#destroy_two'

  post 'games/update_player'

end
