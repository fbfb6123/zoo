Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root 'tops#index' 

  resources :users, only: [:index,:show, :edit, :update]
  resources :dogs, only: [:index]
  resources :cats, only: [:index]
  resources :areas, only: [:index]
  resources :dogs, only: [:index,:new,:create]
  resources :events, only: [:index,:new,:create,:show]
  resources :facilities, only: [:index,:new,:create,:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :animals, only: [:index,:new,:create,:edit, :update]
  end

  resources :reviews, only: [:index,:new,:create, :edit, :update]



  resources :animals, only: [:index,:new,:create,:show, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :contacts, only: [:index,:new,:create,:edit, :update]
    resources :reviews, only: [:create, :show, :edit, :update]
  end

end
