require 'sidekiq/web' 
Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create]
  get "events/:event_id/enroll", to: "events#enroll", as: "event_enroll"
  get "events/:event_id/unenroll", to: "events#unenroll", as: "event_unenroll"
  mount Sidekiq::Web => '/sidekiq'
  root "events#index"
  resources :employees
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
