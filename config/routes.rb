Rails.application.routes.draw do
  root to: "pages#index"
  resources :users do
    collection do
      resource :sessions, only: [:new, :create, :destroy]
      resource :confirmations, only: [:show]
    end
  end
end
