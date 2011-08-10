Rails.application.routes.draw do
  
  namespace :admin do
    resources :kommentare
  end
  
end
