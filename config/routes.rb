Rails.application.routes.draw do
  root 'home#index'

  get "/news", to: "news#index"

  get "/articles", to: "static_pages#articles"
  get "/merch", to: "static_pages#merch"
  get "/contact", to: "static_pages#contact"
  get "/fans", to: "static_pages#fans"
  get "/about", to: "static_pages#about"
  get "/purpose", to: "static_pages#purpose"

  resources :shows, only: [:index]
  get "/shows/:year", to: "shows#shows_by_year", as: :shows_year,
    constraints: {:year => /\d{4}/}

  get "/shows/:year/:month", to: "shows#shows_by_month", as: :shows_month,
    constraints: {:year => /\d{4}/, :month => /\d{2}/}

  get "/shows/:year/:month/:day", to: "shows#shows_by_day", as: :shows_day,
    constraints: {:year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/}

  get "/shows/:year/:month/:day/:id", to: "shows#show", as: :show,
    constraints: {:year => /\d{4}/, :month => /\d{2}/, :day => /\d{2}/}

  resources :videos, only: [:index]
end
