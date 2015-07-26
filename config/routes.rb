Rails.application.routes.draw do


  root 'categories#index'

  get "login"     => 'sessions#new'
  post "login"    => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "users/admin" => 'users#admin'

  get '/users/unsubscribe/:signature' => 'users#unsubscribe', as: 'unsubscribe'

  resources :users

  resources :items

  resources :rates


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

    require "sidekiq/web"
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
    end if Rails.env.production?
    mount Sidekiq::Web, at: "/sidekiq"

end
