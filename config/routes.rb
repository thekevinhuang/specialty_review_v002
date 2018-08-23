Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :users
  
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :activities do
    resources :item_categories
  end
  
  resources :item_categories do
    resources :item_models
  end

  resources :item_models

  resources :item_model_characteristics, only: [:new, :create]

  resources :characteristics
  
  resources :ratings
end
