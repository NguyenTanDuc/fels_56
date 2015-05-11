Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sign_up' => 'users#new'
  get 'sign_up' => 'users#new'
  get 'log_in' => 'sessions#new'
  post 'log_in' => 'sessions#create'
  delete 'log_out' => 'sessions#destroy'

  resources :users, except: [:index]
  resources :words
  resources :categories
  resources :lessons, except: [:edit, :update]

end
