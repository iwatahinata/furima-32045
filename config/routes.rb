Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/search'
  resources :items do
    resources :buys, only: [:create, :index]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end
