Rails.application.routes.draw do

  resources :users
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  namespace :trucking do
    root to: 'dashboard#index', as: 'dashboard'
  end

  namespace :supplier do
    root to: 'dashboard#index', as: 'dashboard'
    resources :retailers
    resources :fuel_prices
    resources :contacts
  end

  namespace :retailer do
    root to: 'dashboard#index', as: 'dashboard'
    resources :stations
    resources :tanks
  end

  namespace :admin do
    root to: 'dashboard#index', as: 'dashboard'
    resources :retailers
    resources :suppliers
    resources :truckings
    resources :users, only: [:index, :edit, :update]
    resources :stations do
      resources :tanks
    end
  end

  get 'home/index'
  get 'home/minor'

  root to: 'home#index'
end
