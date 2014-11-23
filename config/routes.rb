Rails.application.routes.draw do
  root 'static_pages#home'

  get "/news", to: "static_pages#news"
  get "/articles", to: "static_pages#articles"
  get "/merch", to: "static_pages#merch"

  get "/fans", to: "static_pages#fans"
  get "/about", to: "static_pages#about"
  get "/purpose", to: "static_pages#purpose"

  resources :shows, only: [:index, :show]
  resources :videos, only: [:index]
end
