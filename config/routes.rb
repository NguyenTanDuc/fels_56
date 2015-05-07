Rails.application.routes.draw do
  root      'static_pages#home'
  resources :words
  resources :categories
  resources :lessons, except: [:edit, :update]
end
