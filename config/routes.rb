Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sign_up' => 'users#new'
  get 'sign_up' => 'users#new'
  get 'log_in' => 'sessions#new'
  post 'log_in' => 'sessions#create'
  delete 'log_out' => 'sessions#destroy'

  resources :users, except: [:destroy]
  resources :words, only: [:index]
  resources :categories, only: [:index]

  namespace :admin do
    root to: "words#index"
    resources :words
    resources :categories
  end
end
