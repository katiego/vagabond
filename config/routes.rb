Rails.application.routes.draw do

# Post routes
root 'posts#index'
get "/new", to: "posts#new"
resources :posts

# User routes
get "/signup", to: "users#new"
get "/profile", to: "users#show"
resources :users


# Session routes
get "/login", to: "sessions#new"
post "/login", to: "sessions#create"
delete "/logout", to: "sessions#destroy"
resources :sessions, only: [:create, :destroy]


end


#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         posts#index
#     posts POST   /posts(.:format)          posts#create
#  new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
#      post GET    /posts/:id(.:format)      posts#show
#           PATCH  /posts/:id(.:format)      posts#update
#           PUT    /posts/:id(.:format)      posts#update
#           DELETE /posts/:id(.:format)      posts#destroy
#    signup GET    /signup(.:format)         users#new
#   profile GET    /profile(.:format)        users#show
#     users POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     login GET    /login(.:format)          sessions#new
#    logout GET    /logout(.:format)         sessions#destroy
#  sessions POST   /sessions(.:format)       sessions#create
#   session DELETE /sessions/:id(.:format)   sessions#destroy
