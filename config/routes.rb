Rails.application.routes.draw do
 
  devise_for :users
  root to: 'livings#index'
  resources :users, only: [:show, :get]
  resources :livings, only: [:index] do
  # Fordetails on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
