Rails.application.routes.draw do
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
