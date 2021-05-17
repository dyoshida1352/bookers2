Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :homes, only: [:index]
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]

end
