Rails.application.routes.draw do

  match("/", { :controller => "users", :action => "index", :via => "get" })

  # User routes

  # CREATE
  match("/post_user", {:controller => "users", :action => "create", :via => "get"})

  # READ
  match("/users", {:controller => "users", :action => "index", :via => "get"})
  match("/users/:username", {:controller => "users", :action => "show", :via => "get"})
  match("/users/:username/own_photos", {:controller => "users", :action => "own_photos", :via => "get"})
  match("/users/:username/liked_photos", {:controller => "users", :action => "liked_photos", :via => "get"})
  match("/users/:username/feed", {:controller => "users", :action => "feed", :via => "get"})
  match("/users/:username/discover", {:controller => "users", :action => "discover", :via => "get"})
  

  # UPDATE
  match("/patch_user/:fr_user_id", {:controller => "users", :action => "update", :via => "get"})

  # DELETE
  match("/delete_user/:fr_user_id", {:controller => "users", :action => "destroy", :via => "get"})
  

  
  # Photo routes

  # CREATE
  match("/post_photo", { :controller => "photos", :action => "create", :via => "get"})

  # READ
  match("/photos", { :controller => "photos", :action => "index", :via => "get"})

  match("/photos/:fr_photo_id", { :controller => "photos", :action => "show", :via => "get"})
  
  match("/photos/:fr_photo_id/comments", { :controller => "photos", :action => "comments", :via => "get"})
  match("/photos/:fr_photo_id/likes", { :controller => "photos", :action => "likes", :via => "get"})
  match("/photos/:fr_photo_id/fans", { :controller => "photos", :action => "fans", :via => "get"})

  # UPDATE
  match("/patch_photo/:fr_photo_id", { :controller => "photos", :action => "update", :via => "get"})

  # DELETE
  match("/delete_photo/:fr_photo_id", { :controller => "photos", :action => "destroy", :via => "get"})


  # Like routes

  # CREATE
  match("/post_like", {:controller => "likes", :action => "create", :via => "get"})

  # READ
  match("/likes", {:controller => "likes", :action => "index", :via => "get"})
  match("/likes/:fr_like_id", {:controller => "likes", :action => "show", :via => "get"})

  # UPDATE
  match("/patch_like/:fr_like_id", {:controller => "likes", :action => "update", :via => "get"})

  # DELETE
  match("/delete_like/:fr_like_id", {:controller => "likes", :action => "destroy", :via => "get"})
  
  # Comment routes

  # CREATE
  match("/post_comment", { :controller => "comments", :action => "create", :via => "get"})

  # READ
  match("/comments", { :controller => "comments", :action => "index", :via => "get"})
  match("/comments/:fr_comment_id", { :controller => "comments", :action => "show", :via => "get"})

  # UPDATE
  match("/patch_comment/:fr_comment_id", { :controller => "comments", :action => "update", :via => "get"})

  # DELETE
  match("/post_comment", { :controller => "comments", :action => "create", :via => "get"})

  match("/delete_comment/:fr_comment_id", { :controller => "comments", :action => "destroy", :via => "get"})


  # ============

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
