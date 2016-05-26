Rails.application.routes.draw do

  resources :routes
  resources :cities
  resources :states
  resources :users
  resources :landmarks
  resources :waypoints

  post '/owner' => 'owners#create'
  patch '/owner' => 'owners#edit'
  delete '/owner' => 'owners#destroy'
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  root 'main#index'

end
