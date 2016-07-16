Rails.application.routes.draw do
  root 'static_pages#home'
  get '/new_game', to: 'games#new'
  get '/help', to: 'static_pages#help'
  resources :games
end
