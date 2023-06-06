Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  get '/sessions/:id', to: 'sessions#show', as: 'session'
  resources "places"
  resources "posts"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources "users"
end
