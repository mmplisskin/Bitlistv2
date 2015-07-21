Rails.application.routes.draw do


  root 'categories#index'

  get "login"     => 'sessions#new'
  post "login"    => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users

  resource :items


  resources :categories do
    resources :items
  end

  get '/static_pages/about' => 'static_pages#about'

   get '/search' => "items#search", as: :search_items

   resources :items do
    collection do
    get 'search'
    end
  end

end
