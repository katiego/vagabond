Rails.application.routes.draw do

# Post routes
root 'posts#index'
get "/new", to: "posts#new"
resources :posts do 
	resources :comments
	end

# User routes
get "/signup", to: "users#new"

resources :users


# Session routes
get "/login", to: "sessions#new"
post "/login", to: "sessions#create"
delete "/logout", to: "sessions#destroy"
resources :sessions, only: [:create, :destroy]

# City routes
resources :cities do 
	resources :posts 
end 

end


# #         Prefix Verb   URI Pattern                               Controller#Action
#    cities_show GET    /cities/show(.:format)                    cities#show
#           root GET    /                                         posts#index
#            new GET    /new(.:format)                            posts#new
#          posts GET    /posts(.:format)                          posts#index
#                POST   /posts(.:format)                          posts#create
#       new_post GET    /posts/new(.:format)                      posts#new
#      edit_post GET    /posts/:id/edit(.:format)                 posts#edit
#           post GET    /posts/:id(.:format)                      posts#show
#                PATCH  /posts/:id(.:format)                      posts#update
#                PUT    /posts/:id(.:format)                      posts#update
#                DELETE /posts/:id(.:format)                      posts#destroy
#         signup GET    /signup(.:format)                         users#new
#        profile GET    /profile(.:format)                        users#show
#          users GET    /users(.:format)                          users#index
#                POST   /users(.:format)                          users#create
#       new_user GET    /users/new(.:format)                      users#new
#      edit_user GET    /users/:id/edit(.:format)                 users#edit
#           user GET    /users/:id(.:format)                      users#show
#                PATCH  /users/:id(.:format)                      users#update
#                PUT    /users/:id(.:format)                      users#update
#                DELETE /users/:id(.:format)                      users#destroy
#          login GET    /login(.:format)                          sessions#new
#                POST   /login(.:format)                          sessions#create
#         logout DELETE /logout(.:format)                         sessions#destroy
#       sessions POST   /sessions(.:format)                       sessions#create
#        session DELETE /sessions/:id(.:format)                   sessions#destroy
#     city_posts GET    /cities/:city_id/posts(.:format)          posts#index
#                POST   /cities/:city_id/posts(.:format)          posts#create
#  new_city_post GET    /cities/:city_id/posts/new(.:format)      posts#new
# edit_city_post GET    /cities/:city_id/posts/:id/edit(.:format) posts#edit
#      city_post GET    /cities/:city_id/posts/:id(.:format)      posts#show
#                PATCH  /cities/:city_id/posts/:id(.:format)      posts#update
#                PUT    /cities/:city_id/posts/:id(.:format)      posts#update
#                DELETE /cities/:city_id/posts/:id(.:format)      posts#destroy
#         cities GET    /cities(.:format)                         cities#index
#                POST   /cities(.:format)                         cities#create
#       new_city GET    /cities/new(.:format)                     cities#new
#      edit_city GET    /cities/:id/edit(.:format)                cities#edit
#           city GET    /cities/:id(.:format)                     cities#show
#                PATCH  /cities/:id(.:format)                     cities#update
#                PUT    /cities/:id(.:format)                     cities#update
#                DELETE /cities/:id(.:format)                     cities#destroy
