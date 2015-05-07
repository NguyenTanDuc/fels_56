Rails.application.routes.draw do
  root      'static_pages#home'
  get  'sign_up' => 'users#new'
  resources :users, except: [:index]   
  resources :words
  resources :categories
  resources :lessons, except: [:edit, :update]
end
