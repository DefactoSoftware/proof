Rails.application.routes.draw do
  root to: "pages#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :requirements, only: [:index, :show, :create, :destroy]
end
