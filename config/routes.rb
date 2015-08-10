Rails.application.routes.draw do

# Post routes
root 'posts#index'
get "/new", to: "posts#new"
resources :posts, only: [:new, :edit, :update, :create, :destroy, :show]

# User routes
get "/signup", to: "users#new"
get "/profile", to: "users#show"
resources :users, only: [:new, :create, :destroy, :edit, :update, :show]

# Session routes
get "/login", to: "sessions#new"
get "/logout", to: "sessions#destroy"
resources :sessions, only: [:create, :destroy]


end
