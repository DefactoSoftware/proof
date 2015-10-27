Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  root to: "pages#index"

  resources :users, only: [:index, :show, :edit, :update, :create] do
    resources :user_requirements, as: :requirements, only: [:index, :create]
    resource :password, controller: "clearance/passwords",
              only: [:create, :edit, :update]
  end

  resources :requirements, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :evidences, only: [:new, :create, :edit, :update, :show]
    post "/evidences/:id/approve", to: "evidences#approve", as: "approve_evidence"
    post "/evidences/:id/disapprove", to: "evidences#disapprove", as: "disapprove_evidence"
  end
end
