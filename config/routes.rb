Viddit::Application.routes.draw do
  resources :videos
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'dashboard#index'

  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get  'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  delete 'signout', to: 'sessions#destroy'
end
