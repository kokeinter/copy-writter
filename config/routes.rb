Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'copies#index'
  resources :users
  resources :odais , only: [:index, :new, :create, :edit, :update, :destroy]do
    resources :copies do
      resources :comments , only: [:create, :destroy]
    end
  end
  resources :likes, only: [:create, :destroy]
end
