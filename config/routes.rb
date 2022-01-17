Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update, :destroy]

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'updatepassword', to: 'users#updatepassword'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  get 'newgroup', to: 'groups#new'
  resources :groups, except: [:new]
  post 'joingroup', to: 'groups#joingroup'
  post 'leavegroup', to: 'groups#leavegroup'

  resources :invites, only: [:new, :create, :index, :destroy]

end
