Viddit::Application.routes.draw do
  root 'dashboard#index'

  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get  'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'

  delete 'signout', to: 'sessions#destroy'
end
