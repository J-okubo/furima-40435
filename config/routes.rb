Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:index,:new,:create, :show, :edit, :update, :destroy]
  resources :items, only: [:new, :create, :edit, :update, :show, :destory]
end
