Rails.application.routes.draw do
  root  to: 'static_pages#assign'
  get     '/home',       to: 'static_pages#home'
  get     '/admin',      to: 'static_pages#admin'
  get     '/signup',     to: 'users#new'
  post    '/signup',     to: 'users#create'
  get     '/login',      to: 'sessions#new'
  post    '/login',      to: 'sessions#create'
  delete  '/logout',     to: 'sessions#destroy'
  resources :users, only: [:create, :new, :edit, :update]
  resources :students, only: [:create, :new]
  resources :lectures, only: [:create, :new, :edit, :update], shallow: true do
    resources :lecture_years, only: [:index, :edit, :update], shallow: true do
      resources :lecture_times, only: [:index, :edit, :update], shallow: true do
        resources :progresses, only: [:index, :update]
        resources :questions, only: [:index]
      end
    end
  end
  resources :questions, only: [:create, :new, :edit, :update]
  resource :achievments, only: [:update]
  resource :public_lecture, only: [:destroy]
end
