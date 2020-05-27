Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'homes#top'
   get 'home/about' => 'homes#about'
   # searchのURL記載する②

  resources :users
  get '/search' => 'searches#search'

  resources :books
end