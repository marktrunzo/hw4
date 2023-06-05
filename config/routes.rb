Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  get '/sessions/:id', to: 'sessions#show', as: 'session'
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
end
