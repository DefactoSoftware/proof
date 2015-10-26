Rails.application.routes.draw do
  root to: "pages#index"
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show", as: 'user'
end
