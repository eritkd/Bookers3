Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users, only: [:show, :edit, :index ,:new, :update] 
  
  resources :books, only: [:new, :create, :index, :show, :edit ,:update, :destroy] 
  
  get "home/about" => "homes#about" ,as: 'about'
  
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
