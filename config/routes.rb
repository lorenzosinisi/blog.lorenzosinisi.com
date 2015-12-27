Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :posts, :only => [:index, :show]

  devise_for :users
  root :to => 'homepage#index'
  get '/about' => 'homepage#about'
end
