Rails.application.routes.draw do

  devise_for :users
  root :to => 'homepage#index'
  get '/about' => 'homepage#about'
end
