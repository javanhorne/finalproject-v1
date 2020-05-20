Rails.application.routes.draw do

  get("/createprofile", { :controller  => "application", :action => "create_profile"})
  get("/", {:controller => "application", :action => "home"})
  get("/test", {:controller => "application", :action => "test"})
  post("/add_diagnosis", {:controller => "application", :action => "add_diagnosis"})

  get("/fhir", { :controller => "api", :action => "fhir_call"})










  # Write your routes above this line
  # =================================

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
