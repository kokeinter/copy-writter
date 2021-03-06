Rails.application.routes.draw do

  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  get 'companies/:id' => 'companies#show'

  # devise_for :companies
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'copies#index'
  resources :users
  resources :companies
  resources :recruits do
    resources :applies
  end

  resources :odais , only: [:index, :new, :create, :edit, :update, :destroy]do
    resources :copies do
      resources :comments , only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end
end
