Rails.application.routes.draw do
  resources :itineraries do
    resources :destinations
  end

  get 'users/show'

  get 'users/edit'

  get 'access/login'

  get 'access/signup'

  get 'access/create'

  get 'access/attempt_login'

  end
