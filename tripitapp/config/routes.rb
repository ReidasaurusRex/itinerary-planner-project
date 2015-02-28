Rails.application.routes.draw do
  resources :itineraries do
    resources :destinations
  end

  root 'access#login'

  get 'users/:id', as: :user_show

  get 'user/:id/edit', as: :user_edit

  put 'user/:id/edit'

  get 'access/login', as: :login

  get 'access/signup', as: :signup

  post 'access/create', as: :create_user

  post 'access/attempt_login'

  delete 'logout', to: "access#logout", as: :logout

end