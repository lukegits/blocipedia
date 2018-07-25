Rails.application.routes.draw do

  get 'charges/create'
  devise_for :users

  get 'welcome/index'
  get 'welcome/about'
  root 'welcome#index'
  resources :users do
    member do
      post :downgrade
    end
  end
  resources :wikis

  resources :charges, only: [:new, :create]
end
