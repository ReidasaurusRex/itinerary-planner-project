Rails.application.routes.draw do
  resources :itineraries do
    resources :destinations
  end

  root 'access#login'

  get 'users/:id', to: "users#show", as: :user

  get 'users/:id/edit', to: "users#user_edit", as: :user_edit

  put 'users/:id/edit', to: "users#update"

  get 'access/login', as: :login

  get 'access/signup', as: :signup

  post 'access/signup', to: "access#create_user", as: :signup_user

  post 'access/attempt_login', to: "access#access_attempt_login", as: :login_attempt 

  delete 'logout', to: "access#logout", as: :logout

end


#     Prefix Verb   URI Pattern                                                Controller#Action
#     itinerary_destinations GET    /itineraries/:itinerary_id/destinations(.:format)          destinations#index
#                            POST   /itineraries/:itinerary_id/destinations(.:format)          destinations#create
#  new_itinerary_destination GET    /itineraries/:itinerary_id/destinations/new(.:format)      destinations#new
# edit_itinerary_destination GET    /itineraries/:itinerary_id/destinations/:id/edit(.:format) destinations#edit
#      itinerary_destination GET    /itineraries/:itinerary_id/destinations/:id(.:format)      destinations#show
#                            PATCH  /itineraries/:itinerary_id/destinations/:id(.:format)      destinations#update
#                            PUT    /itineraries/:itinerary_id/destinations/:id(.:format)      destinations#update
#                            DELETE /itineraries/:itinerary_id/destinations/:id(.:format)      destinations#destroy
#                itineraries GET    /itineraries(.:format)                                     itineraries#index
#                            POST   /itineraries(.:format)                                     itineraries#create
#              new_itinerary GET    /itineraries/new(.:format)                                 itineraries#new
#             edit_itinerary GET    /itineraries/:id/edit(.:format)                            itineraries#edit
#                  itinerary GET    /itineraries/:id(.:format)                                 itineraries#show
#                            PATCH  /itineraries/:id(.:format)                                 itineraries#update
#                            PUT    /itineraries/:id(.:format)                                 itineraries#update
#                            DELETE /itineraries/:id(.:format)                                 itineraries#destroy
#                       root GET    /                                                          access#login
#                  user_show GET    /users/:id(.:format)                                       users#show
#                  user_edit GET    /users/:id/edit(.:format)                                  users#user_edit
#                            PUT    /users/:id/edit(.:format)                                  users#update
#                      login GET    /access/login(.:format)                                    access#login
#                     signup GET    /access/signup(.:format)                                   access#signup
#                create_user POST   /access/create(.:format)                                   access#create
#       access_attempt_login POST   /access/attempt_login(.:format)                            access#attempt_login
<<<<<<< HEAD

#                     logout DELETE /logout(.:format)                                          access#logout
#                     logout DELETE /logout(.:format)                                          access#logout
=======
#                     logout DELETE /logout(.:format)                                          access#logout
>>>>>>> 5cf0b123a32cf3a1016ae2256b534c6bd5bfa856

