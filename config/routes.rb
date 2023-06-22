Rails.application.routes.draw do
  devise_for :users
  root to: "livings#index"
  resources :users, only: [:show]
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :orders, only:[:index, :create]
  end
end
