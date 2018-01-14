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
  resources :lectures, only: [:create, :new] do
    member do
      get 'years', to: 'lectures#lecture_years_index'
      get 'times', to: 'lectures#lecture_times_index'
    end
  end
  resources :lecture_years, only: [] do
    member do
      get  'new',   to: 'lecture_years#lecture_times_new',   as: 'new_times'
      get  'times', to: 'lecture_years#lecture_times_index'
      post 'times', to: 'lecture_years#lecture_times_create'
    end
  end
end
