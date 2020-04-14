Rails.application.routes.draw do
  devise_for :users
  root 'tops#index' 

  resources :users, only: [:show, :edit, :update]
  resources :dogs, only: [:index]
  resources :cats, only: [:index]
  resources :facilities, only: [:index,:new,:create,:show, :edit, :update] do
    resources :animals, only: [:index,:new,:create,:show, :edit, :update]
  end
end
