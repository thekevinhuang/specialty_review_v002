Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  resources :users
  
  get '/signin' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  resources :activities
  resources :item_categories

  resources :item_models do
    resources :characteristics
  end
  
  resources :ratings
end
