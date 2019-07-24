Rails.application.routes.draw do
  match("/users", { :controller => "application", :action => "show", :via => "get" })


  # ============

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
