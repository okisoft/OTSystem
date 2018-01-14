Rails.application.routes.draw do
  root  to: 'static_pages#assign'
  get     '/home',    to: 'static_pages#home'
  get     '/admin',   to: 'static_pages#admin'
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  resources :users, only: [:create, :new, :edit, :update]
  resources :students, only: [:create, :new]
  resources :lectures, only: [] do
    member do
      get :years
      get :times
    end
  end
  resources :lecture_years, only: [] do
    member do
      get :times
    end
  end
end
