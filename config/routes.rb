Movies::Application.routes.draw do
  get "movies" => "movies#index"
  get "movies/show/:id" => "movies#show"
  get "movies/edit/:id" => "movies#edit", as: :movie
  patch "movies/edit/:id" => "movies#update"
  get "movies/search" => "movies#search"
  get "/search" =>"movies#results"
  get "movies/new" => "movies#new"
  post "movies" => "movies#create"
end