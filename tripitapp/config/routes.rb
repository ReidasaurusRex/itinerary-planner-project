Rails.application.routes.draw do
  resources :itineraries do
    resources :destinations
  end

  root 'access#login'

  get 'users/show', as: :user

  get 'user/edit', as: :user_edit

  put 'user/edit'

  get 'access/login', as: :login

  get 'access/signup', as: :signup

  post 'access/create', as: :create_user

  post 'access/attempt_login'

  delete 'logout', to: "access#logout", as: :logout

end


# Prefix Verb   URI Pattern                                                Controller#Action
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
#                       user GET    /users/show(.:format)                                      users#show
#                  user_edit GET    /users/edit(.:format)                                      users#edit
#                 users_edit PUT    /users/edit(.:format)                                      users#edit
#                      login GET    /access/login(.:format)                                    access#login
#                     signup GET    /access/signup(.:format)                                   access#signup
#                create_user POST   /access/create(.:format)                                   access#create
#       access_attempt_login POST   /access/attempt_login(.:format)                            access#attempt_login
