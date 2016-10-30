Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, only: [:new, :create, :index, :destroy]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
