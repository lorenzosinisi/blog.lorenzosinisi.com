Rails.application.routes.draw do

  resources :posts, :only => [:index, :show]

  devise_for :users
  root :to => 'homepage#index'
  get '/about' => 'homepage#about'
end
