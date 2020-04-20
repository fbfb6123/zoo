Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :contacts
  devise_for :users
  root 'tops#index' 

  resources :users, only: [:show, :edit, :update]
  resources :dogs, only: [:index]
  resources :cats, only: [:index]
  resources :areas, only: [:index]
  resources :dogs, only: [:index,:new,:create]
  resources :events, only: [:index,:new,:create,:show]
  resources :facilities, only: [:index,:new,:create,:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :animals, only: [:index,:new,:create,:edit, :update]
  end




  resources :animals, only: [:show] do
    resources :favorites, only: [:create, :destroy]
  end

end