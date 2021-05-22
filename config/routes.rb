Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "/home/about" => "homes#about"
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :create, :show, :edit, :update]

end
