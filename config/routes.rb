Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show", as: :post
  post "/posts", to: "posts#create"
end

