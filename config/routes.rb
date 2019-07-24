Rails.application.routes.draw do
  get "/users" => "users#index"
  get "/users/:username" => "users#show"
  get "/users/:username/own_photos" => "users#own_photos"
  get "/users/:username/liked_photos" => "users#liked_photos"
  get "/users/:username/feed" => "users#feed"
  get "/users/:username/discover" => "users#discover"

  get "/photos/:id" => "photos#show"
  get "/photos/:id/likes" => "photos#likes"
  get "/photos/:id/fans" => "photos#fans"
  get "/photos/:id/comments" => "photos#comments"

  

  # ============

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
