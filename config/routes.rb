Rails.application.routes.draw do
  root to: "pages#index"
  get "/users", to: "users#index"
end
