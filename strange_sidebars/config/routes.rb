Rails.application.routes.draw do
  
  namespace :admin do
    resources :sidebars
  end
  
end
