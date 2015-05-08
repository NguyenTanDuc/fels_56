Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, except: [:index] 
  get  'sign_up' => 'users#new'
end
