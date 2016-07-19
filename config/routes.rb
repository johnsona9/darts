Rails.application.routes.draw do
  root 'static_pages#home'
  get '/new_game', to: 'games#new'
  get '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'
  resources :games
  resources :users

  post 'games/update_player'
  post 'games/player_one_15'
  post 'games/player_two_15'
  post 'games/player_one_16'
  post 'games/player_two_16'
  post 'games/player_one_17'
  post 'games/player_two_17'
  post 'games/player_one_18'
  post 'games/player_two_18'
  post 'games/player_one_19'
  post 'games/player_two_19'
  post 'games/player_one_20'
  post 'games/player_two_20'
  post 'games/player_one_be'
  post 'games/player_two_be'

end
