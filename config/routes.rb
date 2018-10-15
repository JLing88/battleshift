Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  get '/register', to: "users#new"
  get '/dashboard', to: "welcome#show"
  get '/activation/:id', to: "activation#show"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
      end

      resources :users, only: [:index, :show, :update]
    end
  end
  resources :users, only: [:show, :index, :edit, :update, :create]
end
