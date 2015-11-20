Rails.application.routes.draw do

get '/login', to: 'sessions#new'
post '/sessions', to: 'sessions#create'
delete '/sessions', to: 'sessions#destroy'


resources :users
resources :posts do
  resources :comments, shallow: true, only:[:create, :destroy]
end

get 'photos/new'

get 'photos/create'

get 'photos/index'

resources :photos, only: [:new, :create, :index, :destroy]
# root to: 'photos#index'

get '/profile', to: 'users#profile'
get '/profile/:username', to: 'users#show', as: 'profile_user'
  
root 'users#index'  

end
