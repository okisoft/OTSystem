Rails.application.routes.draw do
  root  to: 'static_pages#home'
  get     '/home',    to: 'static_pages#home'
  get     '/admin',   to: 'static_pages#admin'
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :users, only: [:create]
end
