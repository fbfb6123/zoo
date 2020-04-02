Rails.application.routes.draw do
  devise_for :users
  root 'tops#index' 

  resources :users, only: [:show, :edit, :update]
end
