Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "/posts", to: "posts#index"
  get "/posts/:id", to: "posts#show"
end

