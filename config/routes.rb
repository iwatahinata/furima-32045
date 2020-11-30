Rails.application.routes.draw do
  get 'comments/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :buys, only: [:create, :index]
    resources :comments, only: [:create, :new]
  end
end
